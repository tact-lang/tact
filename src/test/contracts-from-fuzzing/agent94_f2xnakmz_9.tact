struct SerTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
}

contract SerializationFields {
    data: SerTest;

    init() {
        self.data = SerTest{
            a: 255,
            b: -32768,
            c: 4294967295
        };
    }
}