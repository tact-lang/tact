struct AltSerialization {
    smallInt: Int as uint4;
    bigInt: Int as int128;
    coinsVal: Int as coins;
}

contract AltSerialFields {
    data: AltSerialization;

    init() {
        self.data = AltSerialization{
            smallInt: 5,
            bigInt: -12345,
            coinsVal: ton("1")
        };
    }
}