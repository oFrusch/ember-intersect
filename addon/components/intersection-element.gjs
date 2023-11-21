import didInsert from '@ember/render-modifiers/modifiers/did-insert';
import willDestroy from '@ember/render-modifiers/modifiers/will-destroy';
import Component from '@glimmer/component';
import { action } from '@ember/object';

/**
 * @typedef {Object} IntersectionElementArgs
 * @property {Function} onIntersect
 */
export default class IntersectionElement extends Component {
  /** @type {IntersectionObserver} */
  observer = null;

  constructor() {
    super(...arguments);

    if (!this.args.onIntersect) {
      throw new Error('IntersectionElement requires an `onIntersect` argument');
    }
  }

  @action
  setupIntersectionObserver(element) {
    this.observer = new IntersectionObserver((entries) => {
      if (!entries[0].isIntersecting) return;

      this.args.onIntersect?.();
    });

    this.observer.observe(element);
  }

  @action
  removeIntersectionObserver(element) {
    this.observers.unobserve(element);
  }

  <template>
    <div
      class='intersection-observer-element'
      {{didInsert this.setupIntersectionObserver}}
      {{willDestroy this.removeIntersectionObserver}}
    />
  </template>
}
