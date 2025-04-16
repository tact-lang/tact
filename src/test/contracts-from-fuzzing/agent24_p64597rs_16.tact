message Msg {
    data: Int;
}

contract Test {
    receive(msg: Msg) {
        msg.data = 10;
    }
}