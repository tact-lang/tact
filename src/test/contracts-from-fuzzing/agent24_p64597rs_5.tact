message Msg {
    data: Int;
}

contract Test {
    receive(msg: Msg) {
        let d = msg.data;
    }
}