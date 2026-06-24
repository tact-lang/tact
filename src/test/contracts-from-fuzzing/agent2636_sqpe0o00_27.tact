struct IntOrdering {
    a: Int as uint8;
    b: Int as uint32;
    c: Int as int64;
    d: Int;
}
contract OrderedInts {
    val: IntOrdering;

    init() {
        self.val = IntOrdering{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
        };
    }
}