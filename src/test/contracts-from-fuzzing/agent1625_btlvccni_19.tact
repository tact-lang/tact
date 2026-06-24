struct TestStruct {
    a: Int;
    b: Int as uint8;
    c: Int as int8;
    d: Int as uint16;
    e: Int as int16;
}

contract MixedSerialized {
    test: TestStruct;

    init() {
        self.test = TestStruct{
            a: 100,
            b: 10,
            c: -10,
            d: 1000,
            e: -1000
        };
    }
}
