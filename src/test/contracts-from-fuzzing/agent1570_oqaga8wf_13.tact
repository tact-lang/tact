struct IntsOnly {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

contract OnlyInts {
    dat: IntsOnly;

    init() {
        self.dat = IntsOnly{ a: 1, b: 2, c: 3, d: 4 };
    }
}