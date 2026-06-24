struct SerTest {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint4;
    d: Int; // default serialization int257
}

contract SerializedFields {
    data: SerTest;

    init() {
        self.data = SerTest{
            a: 3,
            b: -1000,
            c: 5,
            d: 100
        };
    }
}
