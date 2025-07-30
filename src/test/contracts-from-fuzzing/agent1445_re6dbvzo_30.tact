struct EnumLike {
    state: Int as uint8;
}

contract EnumFields {
    data: EnumLike;

    init() {
        self.data = EnumLike{
            state: 2,
        };
    }
}