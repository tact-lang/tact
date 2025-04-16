struct StructA {
    a1: Int;
    a2: Bool;
    a3: String;
}

struct StructB {
    b1: Int?;
    b2: StructA;
}

contract NestedMultipleStructs {
    sB: StructB;
    init() {
        self.sB = StructB{b1:null, b2: StructA{a1:1,a2:true,a3:"hello"}};
    }
}