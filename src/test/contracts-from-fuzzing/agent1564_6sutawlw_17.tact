struct MultiSerial {
    a: Int as uint4;
    b: Int as int16;
    c: Int as uint32;
}

contract VariedSerialization {
    data: MultiSerial;

    init() {
        self.data = MultiSerial{ a: 3, b: -100, c: 50000 };
    }
}