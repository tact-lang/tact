message M {
    nested: Nested;
}

struct Nested {
    z: Int;
}

contract Test {
    receive(msg: M) {
        // nested struct in message
    }
}