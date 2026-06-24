struct SerialFormats {
    smallInt: Int as uint8;
    signedInt: Int as int64;
    bigInt: Int as int257;
    coinVal: Int as coins;
}

contract SerialTest {
    data: SerialFormats;

    init() {
        self.data = SerialFormats{
            smallInt: 255,
            signedInt: -1000,
            bigInt: 1234567890123456789,
            coinVal: ton("1"),
        };
    }
}
