message M {
    optNested: Nested?;
}

struct Nested {
    a: Int;
}

contract Test {
    receive(msg: M) {
        // optional struct in message
    }
}