// Nested struct with optional field
struct Inner {
    x: Int;
}

struct Outer {
    inner: Inner?;
}

contract Test {
    receive() {
        let s: Outer = Outer { inner: null };
    }
}