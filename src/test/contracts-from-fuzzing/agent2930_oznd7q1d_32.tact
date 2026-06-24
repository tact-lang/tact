struct OuterMost {
    s1: SubOne;
    s2: SubTwo;
}

struct SubOne {
    opt: Int?;
    inner: SubInner;
}

struct SubTwo {
    innerOpt: SubInner?;
}

struct SubInner {
    b: Bool;
    s: String;
}

contract OptMixedDeep {
    f: OuterMost;

    init() {
        self.f = OuterMost{
            s1: SubOne{opt:null, inner: SubInner{b:true,s:"x"}},
            s2: SubTwo{innerOpt:null}
        };
    }
}
