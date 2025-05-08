struct InnerMost {
    a: Int;
    b: Bool;
}

struct MidLevel {
    x: InnerMost;
    y: InnerMost;
}

struct TopLevel {
    mid1: MidLevel;
    mid2: MidLevel;
}

contract SuperDeep {
    storage: TopLevel;

    init() {
        self.storage = TopLevel{
            mid1: MidLevel{
                x: InnerMost{ a: 1, b: true },
                y: InnerMost{ a: 2, b: false }
            },
            mid2: MidLevel{
                x: InnerMost{ a: 3, b: true },
                y: InnerMost{ a: 4, b: false }
            }
        };
    }
}