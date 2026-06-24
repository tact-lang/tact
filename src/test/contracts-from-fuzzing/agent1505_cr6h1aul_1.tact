struct DeepNestLevel3 { d: Int; }
struct DeepNestLevel2 { c: DeepNestLevel3; }
struct DeepNestLevel1 { b: DeepNestLevel2; }

contract Test {
    v: DeepNestLevel1;
    init() {
        self.v = DeepNestLevel1{ b: DeepNestLevel2{ c: DeepNestLevel3{ d: 1 } } };
    }
}