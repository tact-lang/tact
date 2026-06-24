struct CompactInts {
    a: Int as int1;
    b: Int as uint2;
    c: Int as int3;
    d: Int as uint4;
    e: Int as int5;
}

contract Test {
    packed: CompactInts;

    init() {
        self.packed = CompactInts {
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5
        };
    }
}