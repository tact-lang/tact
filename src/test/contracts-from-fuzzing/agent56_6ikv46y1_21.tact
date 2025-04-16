struct Inner { a: Int; b: Int; }
struct Outer { inner: Inner; }

contract Test {
    receive() {
        // Test: Nested destructuring in two steps using wildcard discard in inner struct
        let outer: Outer = Outer { inner: Inner { a: 100, b: 200 } };
        let Inner { a, b: _ } = outer.inner;
        dump(a); // Expected output: 100
    }
}
