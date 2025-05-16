struct Ints {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint128;
}

contract SerialFormats {
    data: Ints;
    init() {
        self.data = Ints{ a:5, b:-12, c:1000 };
    }
}