struct DeepInner {
    f1: Int;
    f2: Bool;
}

struct MidLevel {
    d1: DeepInner;
    d2: Int?;
}

struct TopLevel {
    m1: MidLevel;
    m2: Bool;
    m3: Cell;
}

contract DeepNested {
    storage: TopLevel;

    init() {
        self.storage = TopLevel{
            m1: MidLevel{
                d1: DeepInner{
                    f1: 10,
                    f2: false
                },
                d2: null
            },
            m2: true,
            m3: emptyCell()
        };
    }
}