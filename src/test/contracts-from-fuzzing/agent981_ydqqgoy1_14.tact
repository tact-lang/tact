struct N1 { f: Int; }
struct N2 { n1: N1; }
struct N3 { n2: N2; }
struct N4 { n3: N3; }
struct N5 { n4: N4; }

contract FiveNest {
    v: N5;
    init() {
        self.v = N5{ n4: N4{ n3: N3{ n2: N2{ n1: N1{ f: 999 } } } } };
    }
}