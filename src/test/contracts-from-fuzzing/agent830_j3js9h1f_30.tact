message(0x12345678) Msg {}

contract TestMsgInStorage {
    storedMsg: Msg;

    init() {
        self.storedMsg = Msg{};
    }
}