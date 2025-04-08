struct IntAndOpt {
    a: Int;
    b: Int?;
}

contract StructOptMix {
    pers: IntAndOpt;

    init() {
        self.pers = IntAndOpt{ a: 10, b: null };
    }
}