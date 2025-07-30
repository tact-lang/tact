message MyMsg {
    a: Int;
}

contract TestTypedReceiverCorrect {
    receive(msg: MyMsg) {
        // receiver for binary messages of type MyMsg
    }
}
