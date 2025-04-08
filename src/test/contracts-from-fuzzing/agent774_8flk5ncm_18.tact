struct SerializeTest {
    u8: Int as uint8;
    i16: Int as int16;
    coinVal: Int as coins;
    flag: Bool;
    bigInt: Int;
    text: String;
}

contract Serialization {
    s: SerializeTest;
    init() {
        self.s = SerializeTest{
            u8: 255,
            i16: -12345,
            coinVal: ton("1"),
            flag: true,
            bigInt: -1,
            text: "serialize"
        };
    }
}