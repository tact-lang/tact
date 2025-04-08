struct ZeroEnum {
    a: Int = 0;
    b: Int = 1;
    c: Int = 2;
}

contract EnumLike {
    data: ZeroEnum;

    init() {
        self.data = ZeroEnum{};
    }
}
