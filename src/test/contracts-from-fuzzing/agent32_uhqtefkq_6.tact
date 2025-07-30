message TestMsg { value: Int as uint8; }

contract MessageTest() {
    // Test serialization and deserialization of a message struct
    fun testMsg(): Int {
         let msgInstance = TestMsg { value: 123 };
         let cell = msgInstance.toCell();
         let msgDeser = TestMsg.fromCell(cell);
         return msgDeser.value; // expected to be 123
    }

    receive() {
         dump(self.testMsg());
    }
}
