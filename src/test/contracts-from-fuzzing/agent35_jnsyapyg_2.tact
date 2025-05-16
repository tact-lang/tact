message Msg {
    value: Int;
}

contract Test {
    receive(msg: Msg) {
        let val = msg.value;
    }
}