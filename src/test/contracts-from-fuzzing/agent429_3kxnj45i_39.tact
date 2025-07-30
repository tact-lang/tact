struct S1 { a: Int; }

struct S2 { b: Int; }

struct Nesting {
    s1: S1;
    s2: S2;
    val: Int;
}

contract DistrStructs {
    n: Nesting;
    init() {
        self.n = Nesting{
            s1: S1{a:1},
            s2: S2{b:2},
            val: 3
        };
    }
}
