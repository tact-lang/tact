struct ABool {
    a: Bool;
}

struct AOptBool {
    a: Bool?;
}

contract NestedBoolVariants {
    s1: ABool;
    s2: AOptBool;

    init() {
        self.s1 = ABool{a:true};
        self.s2 = AOptBool{a:null};
    }
}