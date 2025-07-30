struct DeepNested {
    level3: Bool;
}

struct MidNested {
    level2: DeepNested;
}

struct Top {
    level1: MidNested;
}

contract TestContract {
    tier: Top;

    init() {
        self.tier = Top{level1: MidNested{level2: DeepNested{level3: false}}};
    }
}