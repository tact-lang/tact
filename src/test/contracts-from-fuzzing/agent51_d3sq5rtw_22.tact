message M {
    optField: Int?;
}

contract Test {
    receive(msg: M) {
        // optional field in message
    }
}