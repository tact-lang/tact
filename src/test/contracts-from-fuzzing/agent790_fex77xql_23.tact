struct SubOpt {
    f: Int?;
}

struct OuterOpt {
    s: SubOpt?;
}

contract NestedMaybe {
    v: OuterOpt;

    init() {
        self.v = OuterOpt{s: SubOpt{f:null}};
    }
}