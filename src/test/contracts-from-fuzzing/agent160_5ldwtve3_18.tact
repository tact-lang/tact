struct SerTest {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
}

contract TestSerialization {
    data: SerTest;
    init() {
        self.data = SerTest{
            a: 1,
            b: 2,
            c: 3,
        };
    }
}