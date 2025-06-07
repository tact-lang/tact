struct S1 { a: Int }
struct S2 { b: Int }

struct Comb {
    s1: S1;
    s2: S2;
}

contract StructComposition {
    c: Comb;

    init() {
        self.c = Comb{
            s1: S1{a:1},
            s2: S2{b:2}
        };
    }
}
