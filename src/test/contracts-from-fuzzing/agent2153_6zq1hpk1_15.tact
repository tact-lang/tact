struct InnerMost {
    z: Int;
}

struct MidLevel {
    y: InnerMost;
}

struct TopLevel {
    x: MidLevel;
}

contract DeepHierarchy {
    data: TopLevel;

    init() {
        self.data = TopLevel{ x: MidLevel{ y: InnerMost{ z: 42 } } };
    }
}
