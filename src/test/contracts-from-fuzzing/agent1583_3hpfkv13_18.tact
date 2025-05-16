struct RemainTest {
    prefix: Int as uint8;
    payload: Slice as remaining;
}

contract RemainStorage {
    msgData: RemainTest;

    init() {
        self.msgData = RemainTest{ prefix: 42, payload: emptyCell().asSlice() };
    }
}