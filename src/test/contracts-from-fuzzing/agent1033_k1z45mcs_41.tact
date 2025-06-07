struct N1 { v: Int; }
struct N2 { n: N1; }
struct N3 { n: N2; }
struct N4 { n: N3; }

contract UltraDeep {
    st: N4;

    init() {
        self.st = N4{ n: N3{ n: N2{ n: N1{ v: 999 } } } };
    }
}