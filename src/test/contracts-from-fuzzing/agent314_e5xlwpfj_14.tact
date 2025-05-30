struct FieldOrderInside {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
}

contract TestContract {
    s: FieldOrderInside;

    init() {
        self.s = FieldOrderInside{
            a: 1,
            b: 2,
            c: 3,
            d: 4
        };
    }
}