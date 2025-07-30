struct SerializedStuff {
    a: Int as int8;
    b: Int as uint4;
    c: Int as int64;
    d: Int as int257;
    e: Int as uint1;
}

contract SerializationWidths {
    data: SerializedStuff;

    init() {
        self.data = SerializedStuff{
            a: -10,
            b: 9,
            c: 1000000,
            d: -5,
            e: 1,
        };
    }
}