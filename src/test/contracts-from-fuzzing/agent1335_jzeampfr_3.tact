struct DeepLevel {
    value: Int;
}

struct MidLevel {
    deep: DeepLevel;
}

struct TopLevel {
    mid: MidLevel;
}

contract DeeplyNested {
    nested: TopLevel;

    init() {
        self.nested = TopLevel{ mid: MidLevel{ deep: DeepLevel{ value: 123 } } };
    }
}
