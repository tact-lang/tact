message(0x2) TestMsg { x: Int }

contract InitMsgStorage {
    m: TestMsg;

    init() {
        self.m = TestMsg{ x: 42 };
    }
}