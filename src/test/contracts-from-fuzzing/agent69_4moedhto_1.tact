struct DeepNested {
    level1: Int;
    level2: InnerStruct;
}

struct InnerStruct {
    sublevel1: Int;
    sublevel2: DeeperStruct;
}

struct DeeperStruct {
    deepest: Int;
}

contract DeepTest {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            level1: 1,
            level2: InnerStruct{
                sublevel1: 2,
                sublevel2: DeeperStruct{
                    deepest: 3,
                }
            }
        };
    }
}