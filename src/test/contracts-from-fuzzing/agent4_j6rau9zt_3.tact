struct Outer {
    inner: Inner
}

struct Inner {
    value: Int
}

contract Test {
    receive() {
        // do nothing
    }
}