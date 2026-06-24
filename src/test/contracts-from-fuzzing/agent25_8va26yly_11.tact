message Msg {
    x: Int;
}

contract Test {
    receive(msg: Msg) {
        let x = 1;
        msg.x = x;
    }
}