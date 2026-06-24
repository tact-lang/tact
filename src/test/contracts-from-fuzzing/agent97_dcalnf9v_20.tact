struct Inner { foo: Int }
struct Outer { bar: Int; inner: Inner }

contract Composed {
    composed: Outer;
    init() {
        self.composed = Outer{bar:11, inner: Inner{foo:22}};
    }
}