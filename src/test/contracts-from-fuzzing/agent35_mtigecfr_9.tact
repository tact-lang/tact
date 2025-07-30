message MyMsg {
    value: Int;
}

contract Test {
    // Testing typed binary receiver: using message MyMsg
    receive(msg: MyMsg) {
        let dummy = msg.value;
    }
}
