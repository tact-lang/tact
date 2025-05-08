struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    s1_opt: S1?;
}

contract CrossNested {
    s2: S2;

    init() {
        self.s2 = S2{
            s1: S1{a:1, b:true},
            s1_opt: null
        };
    }
}