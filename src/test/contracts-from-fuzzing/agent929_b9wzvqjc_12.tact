struct SerStruct {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;
    d: Int as int1;
    e: Int;
}

contract SerializationTest {
    ser: SerStruct;
    init() {
        self.ser = SerStruct{
            a: 1,
            b: -2,
            c: 3,
            d: -1,
            e: 999
        };
    }
}