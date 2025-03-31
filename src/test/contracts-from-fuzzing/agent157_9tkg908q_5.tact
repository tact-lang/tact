message MyMsg {
    a: Int;
}

contract TestTypedMsgReceiver {
    receive(msg: MyMsg) {
        // Handling typed binary message
    }
}
