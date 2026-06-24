struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1o: S1?;
    s1: S1;
    c: String?;
}

contract OptMix {
    s2o: S2?;
    s2: S2;

    init() {
        self.s2o = null;
        self.s2 = S2{ s1o:null, s1: S1{a:1,b:true}, c:null };
    }
}