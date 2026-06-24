struct SerializationStruct {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int8;
    d: Int as uint4;
    e: Int;
}

contract SerializationStructField {
    s: SerializationStruct;

    init() {
        self.s = SerializationStruct{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
        };
    }
}