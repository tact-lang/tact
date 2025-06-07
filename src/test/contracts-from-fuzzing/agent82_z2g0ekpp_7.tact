message TestMsg {
    field: Int as uint8;
}

contract TestMessage {
    fun test() {
       // Instantiate a message struct
       let msg: TestMsg = TestMsg{ field: 55 };
       // Dump the field value; expected: 55
       dump(msg.field);
    }

    receive() {
        self.test();
    }
}
