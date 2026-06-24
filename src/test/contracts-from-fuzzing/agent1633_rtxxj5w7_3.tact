struct DeeplyNested {
    layer1: Level1;
}

struct Level1 {
    layer2: Level2;
}

struct Level2 {
    layer3: Level3;
}

struct Level3 {
    x: Int;
    y: Bool?;
}

contract TestContract {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            layer1: Level1{
                layer2: Level2{
                    layer3: Level3{
                        x: 42,
                        y: null,
                    }
                }
            }
        };
    }
}