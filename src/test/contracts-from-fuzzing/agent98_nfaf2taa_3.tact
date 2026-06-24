struct DeepNested {
    level1: Int;
    level2: NestedLayer;
}

struct NestedLayer {
    sublevel1: Int;
    sublevel2: DeeperLayer;
}

struct DeeperLayer {
    x: Int;
    y: Bool;
}

contract DeepContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: 10,
            level2: NestedLayer{
                sublevel1: 20,
                sublevel2: DeeperLayer{ x: 30, y: false }
            }
        };
    }
}