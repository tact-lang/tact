// Message field optional (should not be allowed)
message M {
    a: Int?;
}

contract Test {
    receive(msg: M) {
        let x = msg.a;
    }
}