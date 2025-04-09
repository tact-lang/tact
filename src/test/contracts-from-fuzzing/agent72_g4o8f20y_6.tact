message MyMsg {
    a: Int;
}

contract Test {
    // Receiver for typed binary messages (as per docs)
    receive(msg: MyMsg) {
        // Utilizing msg field to ensure the function is compiled
        msg.a;
    }
}
