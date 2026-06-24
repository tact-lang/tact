struct DeeplyNested {
    inner: InnerMost;
}

struct InnerMost {
    a: LevelTwo;
}

struct LevelTwo {
    b: Leaf;
}

struct Leaf {
    value: Int;
}

contract DeepStruct {
    root: DeeplyNested;

    init() {
        self.root = DeeplyNested{inner: InnerMost{a: LevelTwo{b: Leaf{value: 99}}}};
    }
}
