message M {
    a: Int;
}

contract Test {
    // Fallback receiver declared first
    receive(msg: Slice) {
        // fallback for binary messages
    }

    // Typed binary message receiver declared second. According to documentation,
    // even though declared after the fallback, this receiver should be preferred for messages of type M.
    receive(msg: M) {
        // handler for MyMessage type M
    }
}
