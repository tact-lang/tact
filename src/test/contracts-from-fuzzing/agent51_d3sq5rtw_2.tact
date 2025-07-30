struct Outer {
    inner: Inner
}

struct Inner {
    y: Int
}

contract Test {
    receive() {
        // compile nested struct types
    }
}