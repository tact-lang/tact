struct MessageLike {
    x: Int;
}

message Msg {
    m: MessageLike;
}

contract MessageField {
    s: MessageLike;

    init() {
        self.s = MessageLike { x: 1 };
    }
}