struct SerialStruct {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint64;
    e: Int as int257; // explicit default
}

contract IntSerialization {
    field: SerialStruct;

    init() {
        self.field = SerialStruct{
            a: 255,
            b: 65535,
            c: -10000,
            d: 1234567890,
            e: 0
        };
    }
}