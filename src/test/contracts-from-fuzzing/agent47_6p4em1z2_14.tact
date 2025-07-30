struct Inner { a: Int }
struct Outer { inner: Inner }

contract TestNestedFieldAccess {
    receive() {
        let o: Outer = Outer { inner: Inner { a: 321 } };
        dump(o.inner.a.toString());
    }
}
