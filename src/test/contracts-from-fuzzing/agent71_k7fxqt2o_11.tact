message MyMsg {
    a: Int;
}

contract Test {
    // Receiver for messages of type MyMsg (typed binary messages)
    receive(msg: MyMsg) {
        // process typed message
    }
}
