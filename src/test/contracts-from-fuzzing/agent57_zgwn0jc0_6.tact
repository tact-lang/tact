message MyMessage {
    value: Int;
}

contract Test {
    a: Int = 0;
    
    receive(msg: MyMessage) {
        self.a = msg.value;
    }
}
