struct SerializeLayout {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
}

contract SerializeTest {
    data: SerializeLayout;

    init() {
        self.data = SerializeLayout{
            a: 1,
            b: -1234,
            c: 777777,
            d: -987654321,
            e: 12345678901234567890,
        };
    }
}