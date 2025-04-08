struct NestedOpt {
    f1: Int?;
    f2: Bool?;
}

struct OuterOpt {
    i: Int;
    nested: NestedOpt;
    flag: Bool?;
}

contract TestOpt {
    s: OuterOpt;

    init() {
        self.s = OuterOpt{
            i: 5,
            nested: NestedOpt{ f1:null, f2:true },
            flag: null,
        };
    }
}