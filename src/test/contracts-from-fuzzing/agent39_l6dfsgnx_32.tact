message N {
    data: Int;
}

message M {
    nested: N;
}

contract Test {
    receive(message: M) {
        message.nested.data = 42;
    }
}