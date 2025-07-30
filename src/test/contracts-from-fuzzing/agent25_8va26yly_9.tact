message Msg {
    x: Int;
}

contract Test {
    receive(msg: Msg) {
        let y = msg.x;
    }
}