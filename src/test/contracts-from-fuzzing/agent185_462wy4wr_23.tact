struct SerializationMosaic {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
    e: Int as uint64;
}

contract SerializedFields {
    data: SerializationMosaic;

    init() {
        self.data = SerializationMosaic{
            a: 1,
            b: -2,
            c: 3,
            d: -4,
            e: 5
        };
    }
}