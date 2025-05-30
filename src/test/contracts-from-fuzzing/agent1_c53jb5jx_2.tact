message MessageWithInt {
    value: Int as uint32;
}

contract TestContract {
    receive(msg: MessageWithInt) {}
}