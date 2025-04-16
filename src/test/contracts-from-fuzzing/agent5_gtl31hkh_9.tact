struct Nested {
    a: Int;
}

message M {
    n: Nested;
}

contract Test {
    receive(msg: M) {
        let x = msg.n;
    }
}