struct DeepNestLevel3 {
    x: Int;
}

struct DeepNestLevel2 {
    l3: DeepNestLevel3;
}

struct DeepNestLevel1 {
    l2: DeepNestLevel2;
}

contract NestedDepth {
    root: DeepNestLevel1;

    init() {
        self.root = DeepNestLevel1{ l2: DeepNestLevel2{ l3: DeepNestLevel3{ x: 42 } } };
    }
}
