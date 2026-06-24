message MyMessage {
    value: Int;
}

contract Test {
    flag: Int = 0;
    
    // Receiver with underscore to discard parameter of type MyMessage
    receive(_: MyMessage) {
        self.flag = 5;
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        self.flag = 6;
    }

    get fun getFlag(): Int {
        return self.flag;
    }
}
