struct Inner { x: Int }
struct Outer { inner: Inner }

contract TestNestedFieldAccess {
    receive() {
        let o: Outer = Outer { inner: Inner { x: 123 } };
        let val: Int = o.inner.x; // expected to be 123
    }
}
