message(0x12345678) OpCodeMessage {
    value: Int as uint32;
}

contract TestContract {
    receive(msg: OpCodeMessage) {}
}