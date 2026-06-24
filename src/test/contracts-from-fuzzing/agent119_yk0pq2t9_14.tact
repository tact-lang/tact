message MsgTest {
    x: Int;
    y: Int?;
}

contract TestContract {
    msgData: MsgTest;
    count: Int = 0;

    init() {
        self.msgData = MsgTest{ x: 5, y: null };
        self.count = 1;
    }
}