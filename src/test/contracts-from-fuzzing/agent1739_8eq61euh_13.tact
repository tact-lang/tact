struct BoolIntSequence {
    a: Bool;
    b: Int;
    c: Bool;
    d: Int;
    e: Bool;
    f: Int;
    g: Bool;
}

contract Test {
    seq: BoolIntSequence;

    init() {
        self.seq = BoolIntSequence{
            a: true,
            b: 10,
            c: false,
            d: 20,
            e: true,
            f: 30,
            g: false
        };
    }
}
