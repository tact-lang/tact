struct ZeroOptional {
    zero: Int as uint8;
    maybeZero: Int?;
}

contract ZeroOptionalTest {
    data: ZeroOptional;

    init() {
        self.data = ZeroOptional{
            zero: 0,
            maybeZero: null,
        };
    }
}