struct SerialOpts {
    small: Int as uint8;
    big: Int as int128;
    optInt: Int?;
    optBool: Bool?;
}

contract SerialOptMix {
    data: SerialOpts;

    init() {
        self.data = SerialOpts{
            small: 255,
            big: -123456789123456789,
            optInt: 123,
            optBool: null,
        };
    }
}