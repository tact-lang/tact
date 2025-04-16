message A {
    x: Int;
}

message B {
    y: Int;
}

contract Test {
    receive(msg: A) {
        // one message
    }
    receive(msg: B) {
        // another message
    }
}