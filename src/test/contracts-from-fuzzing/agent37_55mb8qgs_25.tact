struct TestStruct {
    a: Int as int4;
    b: Int as int8;
    c: Int as uint10;
    d: Int;
}

contract SerializeMix {
    s: TestStruct;

    init() {
        self.s = TestStruct{
            a: -4,
            b: -127,
            c: 1023,
            d: 1234567890
        };
    }
}
