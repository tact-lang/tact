// Nested message inside struct with optional
message Inner {
    z: Int;
}

struct Outer {
    inner: Inner?;
}

contract Test {
    receive() {
        let s: Outer = Outer { inner: null };
    }
}