message Msg {
    x: Int;
}

contract Test {
    receive(msg: Msg) {
        msg.x = 5;
    }
}