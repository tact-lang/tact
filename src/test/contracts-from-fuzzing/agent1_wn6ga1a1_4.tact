message(0x12345678) MyMessage {
    value: Int;
}

contract TestContract {
    receive(msg: MyMessage) {}
}