# ember-intersect

Simple Javascript IntersectionObserver implementation for Ember applications.

## Compatibility

- Ember.js v4.0 or above
- Ember CLI v4.0 or above
- Node.js v18 or above

## Installation

```
ember install ember-intersect
```

or

```
npm install ember-intersect
```

## Usage

This addon provides an `IntersectionElement` component that can be rendered anywhere in your application.
The `IntersectionElement` component accepts a prop, `onIntersect`, which is a callback function that will
be invoked when the element enters the viewport.

Example usage:

```
<div class="my-list">
    {{#each items as |item|}}
        <div class="item">
            {{ item }}
        <div>
    {{/each}}

    <IntersectionElement @onIntersect={{this.loadMoreItems}}>
</div>
```

### Available Arguments

#### `onIntersect`

Callback function invoked when the element enters the viewport. Read more about the [Javascript Intersection Observer API](https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API).

#### `onInsert`

Callback function invoked when the element is initially rendered.

#### `onDestroy`

Callback function invoked when the element is removed from the viewport.

## Contributing

See the [Contributing](CONTRIBUTING.md) guide for details.

## License

This project is licensed under the [MIT License](LICENSE.md).
