struct DeepNested {
    inner1: Int;
    inner2: Bool?;
}

struct Level2 {
    nested1: DeepNested;
    nested2: DeepNested?;
}

struct TopLevel {
    l2_1: Level2;
    l2_2: Level2?;
}

contract DeepNestContract {
    store: TopLevel;

    init() {
        self.store = TopLevel{
            l2_1: Level2{
                nested1: DeepNested{ inner1: 10, inner2: true },
                nested2: null
            },
            l2_2: null
        };
    }
}