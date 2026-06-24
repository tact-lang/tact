struct SerializingInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as coins;
}

contract SerializedFieldsTest {
    data: SerializingInts;

    init() {
        self.data = SerializingInts{
            a: 1,
            b: -12,
            c: 123456,
            d: 1000000000
        };
    }
}