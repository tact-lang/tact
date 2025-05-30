message SimpleMsg {
    value: Int as uint8;
}

contract MessageTest {
    // This receiver function ensures that the message type is correctly handled
    receive(msg: SimpleMsg) {
        dump(msg.value);
    }
}
