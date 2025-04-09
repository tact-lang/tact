// Test 6: Message Struct Usage
// This test validates instantiation and conversion of a message struct.

message TestMsg {
    field: Int as uint8;
}

contract TestMsgUsage {
    fun run() {
        let m: TestMsg = TestMsg{ field: 200 };
        let c: Cell = m.toCell();
        let m2: TestMsg = TestMsg.fromCell(c);
        // Expected dump: 200
        dump(m2.field);
    }
}
