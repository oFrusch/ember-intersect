import didInsert from "@ember/render-modifiers/modifiers/did-insert";
import willDestroy from "@ember/render-modifiers/modifiers/will-destroy";
import Component from "@glimmer/component";
import { action } from "@ember/object";

function debounce(func, delay) {
  let debounceTimer;

  return function (...args) {
    const context = this;

    clearTimeout(debounceTimer);
    debounceTimer = setTimeout(() => func.apply(context, args), delay);
  };
}

/**
 * @typedef {Object} IntersectionElementArgs
 * @property {Function} onIntersect
 * @property {Function} onInsert
 * @property {Function} onDestroy
 */
export default class IntersectionElement extends Component {
  /** @type {IntersectionObserver} */
  observer = null;

  constructor() {
    super(...arguments);

    if (!this.args.onIntersect) {
      throw new Error("IntersectionElement requires an `onIntersect` argument");
    }
  }

  @action
  setupIntersectionObserver(element) {
    this.observer = new IntersectionObserver((entries) => {
      if (!entries[0].isIntersecting) return;

      debounce(() => this.args.onIntersect?.(), 300);
    });

    this.observer.observe(element);

    this.args.onInsert?.(this.observer);
  }

  @action
  removeIntersectionObserver(element) {
    this.args.onDestroy?.(this.observer);

    this.observer.unobserve(element);
  }

  <template>
    <div
      class='intersection-observer-element'
      {{didInsert this.setupIntersectionObserver}}
      {{willDestroy this.removeIntersectionObserver}}
    />
  </template>
}
