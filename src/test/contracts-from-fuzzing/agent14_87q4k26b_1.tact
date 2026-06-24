struct DeepNested {
    level3: Int;
}

struct MidNested {
    optDeep: DeepNested?;
}

struct TopLevel {
    mid: MidNested;
}

contract TestContract {
    storage: TopLevel;

    init() {
        self.storage = TopLevel{
            mid: MidNested{
                optDeep: DeepNested{ level3: 123 },
            }
        };
    }
}