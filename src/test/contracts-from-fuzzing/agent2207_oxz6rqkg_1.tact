struct DeepNestLevel3 { val3: Int; }

struct DeepNestLevel2 {
    val2: DeepNestLevel3;
}

struct DeepNestLevel1 {
    val1: DeepNestLevel2;
}

contract TestDeepNesting {
    nested: DeepNestLevel1;
    init() {
        self.nested = DeepNestLevel1{ val1: DeepNestLevel2{ val2: DeepNestLevel3{ val3: 42 } } };
    }
}