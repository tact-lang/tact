struct OptionalSerializeInts {
    a: Int? as int8;
    b: Int? as uint8;
    c: Int? as int16;
    d: Int? as uint16;
    e: Int? as int32;
    f: Int? as uint32;
}

contract TestContract {
    data: OptionalSerializeInts;

    init() {
        self.data = OptionalSerializeInts{
            a: null,
            b: 5,
            c: null,
            d: 1234,
            e: -123456,
            f: 123456
        };
    }
}