struct SInner { a: Int; }

struct SOuter1 {
    s: SInner;
    k: Int;
}

struct SOuter2 {
    s: SOuter1;
    s2: SInner;
}

contract MultiNesting {
    s: SOuter2;

    init() {
        self.s = SOuter2{
            s: SOuter1{ s: SInner{a:1}, k:2 },
            s2: SInner{a:3}
        };
    }
}