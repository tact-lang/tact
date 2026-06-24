message(0x01) MsgPayload {
    foo: Int;
}

contract MessageStructStorage {
    data: MsgPayload;

    init() {
        self.data = MsgPayload{foo: 42};
    }
}