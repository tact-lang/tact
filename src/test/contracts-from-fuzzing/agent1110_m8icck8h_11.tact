struct InnerMixed {
    small: Int as uint3;
    signed: Int as int16;
    yes: Bool;
}

struct OuterMixed {
    nested: InnerMixed;
    info: String;
    big: Int as uint128;
}

contract TestContract {
    data: OuterMixed;

    init() {
        self.data = OuterMixed{
            nested: InnerMixed{
                small: 7,
                signed: -10,
                yes: true,
            },
            info: "serialize",
            big: 123456789012345678901234567890,
        };
    }
}