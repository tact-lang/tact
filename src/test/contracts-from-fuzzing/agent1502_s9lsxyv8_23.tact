struct DifferentWidths {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint256;
}

contract TestContract {
    s: DifferentWidths;
    init() {
        self.s = DifferentWidths{
            a: 1,
            b: -2,
            c: 3,
            d: -4,
            e: 5
        };
    }
}