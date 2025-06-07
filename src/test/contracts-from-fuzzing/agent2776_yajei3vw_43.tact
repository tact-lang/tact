struct Schema {
    a: Int as uint32;
    b: Int as uint64;
    c: Int as int8;
}

contract TypesMix {
    s: Schema;
    init() {
        self.s = Schema{ a: 12, b: 1000, c: -4 };
    }
}
