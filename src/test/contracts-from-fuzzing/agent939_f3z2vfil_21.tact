struct RangeTest {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint32;
    d: Int as int64;
}

contract TestContract {
    x: RangeTest;

    init() {
        self.x = RangeTest{ a: 5, b: -10, c: 1234567, d: -123456789 };
    }
}