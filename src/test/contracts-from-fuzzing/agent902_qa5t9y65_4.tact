struct DeepLevel3 {
    k: Int;
}

struct DeepLevel2 {
    j: DeepLevel3;
}

struct DeepLevel1 {
    i: DeepLevel2;
}

contract DeepNestedStructs {
    nested: DeepLevel1;

    init() {
        self.nested = DeepLevel1{ i: DeepLevel2{ j: DeepLevel3{ k: 123 } } };
    }
}