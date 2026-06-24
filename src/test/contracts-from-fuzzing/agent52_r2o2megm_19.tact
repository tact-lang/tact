// Scenario M (revised): Nested destructuring split into two steps to discard an inner field

struct Inner { a: Int; b: Int }
struct Outer { inner: Inner }

contract Test {
    receive() {
        // First destructure Outer to get inner
        let Outer { inner } = Outer { inner: Inner { a: 10, b: 20 } };
        // Now destructure inner, discarding field b
        let Inner { a, b: _ } = inner;
        dump(a); // Expected output: 10
    }
}
