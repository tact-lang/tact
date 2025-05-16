message A {
    a: Int;
}

message B {
    b: Int;
}

contract Test {
    // Test for having two distinct typed binary message receivers
    // This should compile and allow separate handling of messages of type A and type B.
    receive(msg: A) {
        // handling message type A
    }

    receive(msg: B) {
        // handling message type B
    }

    // Fallback receiver for all other binary messages
    receive(msg: Slice) {
    }
}
