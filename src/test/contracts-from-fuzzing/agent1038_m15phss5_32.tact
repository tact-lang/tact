struct DeepSpanning {
    a: Int;
    b: Bool;
}

struct SubNestA {
    a: DeepSpanning;
    b: DeepSpanning;
}

struct SubNestB {
    c: DeepSpanning;
    d: DeepSpanning;
}

contract WideDeepStorage {
    f1: SubNestA = SubNestA{
        a: DeepSpanning{a:1,b:true},
        b: DeepSpanning{a:2,b:false}
    };
    f2: SubNestB = SubNestB{
        c: DeepSpanning{a:3,b:true},
        d: DeepSpanning{a:4,b:false}
    };
    init() {}
}