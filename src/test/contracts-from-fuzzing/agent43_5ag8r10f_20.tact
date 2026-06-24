struct NegativeSerializationInt {
    a: Int as int64;
    b: Int as int8;
}

contract NegativeSerialized {
    s: NegativeSerializationInt;

    init() {
        self.s = NegativeSerializationInt{
            a: -500,
            b: -5
        };
    }
}