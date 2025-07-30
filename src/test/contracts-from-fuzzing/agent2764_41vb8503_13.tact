struct C1 { f: Int; }
struct C2 { c: C1; }
struct C3 { c: C2; }
struct C4 { c: C3; }
struct C5 { c: C4; }

contract Chain5 {
    v: C5;
    init() {
        self.v = C5{ c: C4{ c: C3{ c: C2{ c: C1{ f: 7 } } } } };
    }
}