struct SpecSerialize {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;
}

contract SerializeVariantsTest {
    data: SpecSerialize;

    init() {
        self.data = SpecSerialize {
            a: 255,
            b: -12345,
            c: ton("1.5")
        };
    }
}