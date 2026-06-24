struct TestOrder1 {
    a: Int as uint8;
    b: Int as uint32;
    c: Int as int16;
}

contract TestFieldOrder {
    data: TestOrder1;
    init() {
        self.data = TestOrder1{
            a: 1,
            b: 2,
            c: 3
        };
    }
}