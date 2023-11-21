# ember-intersect

Simple Javascript IntersectionObserver implementation for Ember applications.


## Compatibility

* Ember.js v4.0 or above
* Ember CLI v4.0 or above
* Node.js v18 or above


## Installation

```
ember install ember-intersect
```

or 

```
npm install ember-intersect
```

## Usage

This addon provides an `IntersectionElement` component that can be rendered anyone in your application.
The `IntersectionElement` component accepts one prop, `onIntersect`, which is a callback function that will
be called when the element comes into view. 

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
## Contributing

See the [Contributing](CONTRIBUTING.md) guide for details.


## License

This project is licensed under the [MIT License](LICENSE.md).
