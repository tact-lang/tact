message MyMessage {
    value: Int;
}

contract Test4 {
    res: Int = 0;

    // Receiver for typed binary messages
    receive(msg: MyMessage) {
        self.res = msg.value;
    }

    get fun getVal(): Int {
        return self.res;
    }
}
