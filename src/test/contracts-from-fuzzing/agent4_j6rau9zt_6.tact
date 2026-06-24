message Outer {
    inner: Inner
}

message Inner {
    value: Int
}

contract Test {
    receive() {
        // do nothing
    }
}