
message MyMsg {
    value: Int as uint32;
}

contract TestContract {
    receive(msg: MyMsg) {
        // Do nothing, just receive
    }
}
