message MyMsg {
    a: Int;
}

contract TestTypedCorrect {
    flag: Bool = false;

    // Receiver for typed binary messages with a valid message struct
    receive(msg: MyMsg) {
        self.flag = true;
    }
}
