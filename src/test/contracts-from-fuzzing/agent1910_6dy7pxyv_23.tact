struct MessageLike {
    msg: String;
}

contract ListOfMessages {
    m1: MessageLike;
    m2: MessageLike;
    m3: MessageLike;
    m4: MessageLike;

    init() {
        self.m1 = MessageLike{ msg: "A" };
        self.m2 = MessageLike{ msg: "B" };
        self.m3 = MessageLike{ msg: "C" };
        self.m4 = MessageLike{ msg: "D" };
    }
}
