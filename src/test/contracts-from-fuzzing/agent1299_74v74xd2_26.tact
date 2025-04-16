struct MessageLike {
    opcode: Int as uint32;
    param: Int;
}

contract MessageLikeHolder {
    data: MessageLike;

    init() {
        self.data = MessageLike{
            opcode: 42,
            param: 777,
        };
    }
}
