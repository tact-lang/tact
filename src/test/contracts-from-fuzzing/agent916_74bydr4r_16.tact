struct Serialized {
    big: Int as uint128;
    small: Int as uint8;
    signed: Int as int16;
    flag: Bool;
}

contract Test {
    saved: Serialized;

    init() {
        self.saved = Serialized{
            big: 123456789,
            small: 255,
            signed: -1234,
            flag: true,
        };
    }
}