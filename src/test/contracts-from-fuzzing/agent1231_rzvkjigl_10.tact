struct SerTest {
    a: Int as int64;
    b: Int as uint32;
    c: Int as uint4;
}

contract TestContract {
    s: SerTest;

    init() {
        self.s = SerTest{
            a: 123,
            b: 456,
            c: 7
        };
    }
}
