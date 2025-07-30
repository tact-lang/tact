// Message with optional field (questionable)
message Msg {
    x: Int?;
}

contract Test {
    receive(msg: Msg) {
        let a = msg.x;
    }
}