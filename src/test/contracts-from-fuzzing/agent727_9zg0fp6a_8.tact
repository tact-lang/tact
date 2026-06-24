struct StructA {
    a1: Int;
    a2: Int;
}

struct StructB {
    b1: Bool;
    b2: Bool;
}

contract NestedOptionStruct {
    s1: StructA?;
    s2: StructB?;

    init() {
        self.s1 = StructA{a1:1,a2:2};
        self.s2 = StructB{b1:true,b2:false};
    }
}