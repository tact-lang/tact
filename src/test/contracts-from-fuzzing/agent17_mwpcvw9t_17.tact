struct StructA {
    fa1: Int;
}

struct StructB {
    fb1: Int;
    fb2: StructA;
}

struct StructC {
    fc1: Bool;
    fc2: StructB;
}

contract DeeplyMixed {
    cfield: StructC = StructC{fc1: true, fc2: StructB{fb1:1, fb2: StructA{fa1:2}}};
}