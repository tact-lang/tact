
message SimpleMessage {
    value: Int as uint32;
}

contract TestContract {
    receive(msg: SimpleMessage) {
        // Do nothing
    }
}
