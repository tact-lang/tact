struct InnerMost {
    innerVal: Int;
}

struct NestedA {
    obj: InnerMost;
}

struct NestedB {
    obj: NestedA;
}

struct NestedC {
    obj: NestedB;
}

contract WideAndDeep {
    f1: NestedC;
    f2: Int;
    f3: Bool?;
    
    init() {
        self.f1 = NestedC{obj: NestedB{obj: NestedA{obj: InnerMost{innerVal:1}}}};
        self.f2 = 2;
        self.f3 = null;
    }
}