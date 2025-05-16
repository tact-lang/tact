struct SerialTest {
    a: Int as uint8;
    b: Int as uint32;
    c: Int as int64;
    d: Bool;
    e: Bool;
}

contract TestContract {
    val: SerialTest;

    init() {
        self.val = SerialTest{
            a: 1,
            b: 2,
            c: 3,
            d: true,
            e: false
        };
    }
}