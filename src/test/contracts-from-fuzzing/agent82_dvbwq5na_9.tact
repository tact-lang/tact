message MyMessage {
    value: Int;
}

contract Test {
    flag: Int = 0;

    // Receiver for binary messages matching MyMessage type
    receive(msg: MyMessage) {
        self.flag = 10;
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        self.flag = 20;
    }

    get fun getFlag(): Int {
        return self.flag;
    }
}
