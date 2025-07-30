message M {
    optNested: Nested?;
}

message Nested {
    a: Int;
}

contract Test {
    receive(msg: M) {
        // optional message in message
    }
}