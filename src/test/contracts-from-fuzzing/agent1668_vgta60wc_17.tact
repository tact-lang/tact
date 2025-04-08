struct SerialTest {
    x: Int as uint8;
    y: Int as int8;
    z: Int as uint64;
}

contract TestContract {
    s: SerialTest;
    init() {
        self.s = SerialTest{
            x:255,
            y:-128,
            z:123456789
        };
    }
}
