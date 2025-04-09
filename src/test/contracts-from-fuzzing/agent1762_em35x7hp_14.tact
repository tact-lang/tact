struct MessageLike {
    x: Int;
}

contract OptionalAndStruct {
    a: Int? = null;
    s: MessageLike? = null;

    init() {
        self.a = 100;
        self.s = MessageLike{
            x: 200,
        };
    }
}