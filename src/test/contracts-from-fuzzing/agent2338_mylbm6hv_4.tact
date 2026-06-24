struct DeepLevel3 {
    val3: Int;
}

struct DeepLevel2 {
    d3: DeepLevel3;
}

struct DeepLevel1 {
    d2: DeepLevel2;
}

contract DeeplyNested {
    nested: DeepLevel1;

    init() {
        self.nested = DeepLevel1{ d2: DeepLevel2{ d3: DeepLevel3{ val3: 123 } } };
    }
}