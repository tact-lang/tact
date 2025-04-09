struct Packed {
    a: Int as uint1;
    b: Int as uint64;
    c: Int as int256;
    d: Int?;
    e: Int? as uint1;
    f: Int? as int8;
}

contract TestContract {
    packed: Packed;

    init() {
        self.packed = Packed{
            a: 1,
            b: 42,
            c: -5,
            d: null,
            e: null,
            f: null,
        };
    }
}
