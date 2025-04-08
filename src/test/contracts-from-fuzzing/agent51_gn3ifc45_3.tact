struct DeepNested {
    a: Int;
    b: Int;
}

struct MidLevel {
    inner1: DeepNested;
    inner2: DeepNested;
    flag: Bool;
}

struct TopLevel {
    mid: MidLevel;
    count: Int;
}

contract ManyLayers {
    storage: TopLevel;
    init() {
        self.storage = TopLevel{
            mid: MidLevel{
                inner1: DeepNested{ a: 1, b: 2 },
                inner2: DeepNested{ a: 3, b: 4 },
                flag: true,
            },
            count: 42,
        };
    }
}
