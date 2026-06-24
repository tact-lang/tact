struct BigTuple {
    a0: Int as uint8;
    a1: Int as uint8;
    a2: Int as uint8;
    a3: Int as uint8;
    a4: Int as uint8;
    a5: Int as uint8;
    a6: Int as uint8;
    a7: Int as uint8;
    a8: Int as uint8;
    a9: Int as uint8;
}

contract BigTupleTest {
    tup: BigTuple;

    init() {
        self.tup = BigTuple{
            a0: 0, a1: 1, a2: 2, a3: 3, a4: 4,
            a5: 5, a6: 6, a7: 7, a8: 8, a9: 9,
        };
    }
}