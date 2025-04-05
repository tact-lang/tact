message MyMessage {
    value: Int;
}

contract TestContract {
    // Contract is needed, but receive doesn't need to use the message yet.
    receive() {}
}