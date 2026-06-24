message Outer {
    w: Wrapper;
}

struct Wrapper {
    data: Inner;
}

struct Inner {
    value: Int;
}

contract Test {
    receive() {
        // No usage needed
    }
}