struct SerialTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as coins;
}

contract TestContract {
    s: SerialTest;

    init() {
        self.s = SerialTest{
            a:1, b:-2, c:3, d:-4, e:5
        };
    }
}