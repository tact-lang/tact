struct SerializedInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;
}

contract SerializationFormats {
    data: SerializedInts;

    init() {
        self.data = SerializedInts{
            a: 127,
            b: 32000,
            c: 1234567890
        };
    }
}