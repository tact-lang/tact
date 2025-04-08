struct MessageLike {
    op: Int as uint32;
    payload: String;
}

contract StructWithUInt32 {
    data: MessageLike;

    init() {
        self.data = MessageLike{ op: 0x11223344, payload: "data" };
    }
}