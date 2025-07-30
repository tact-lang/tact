struct DeeplyNested {
    nested1: Level1;
}

struct Level1 {
    nested2: Level2;
}

struct Level2 {
    nested3: Level3;
}

struct Level3 {
    value: Int;
}

contract TestContract {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            nested1: Level1{
                nested2: Level2{
                    nested3: Level3{
                        value: 42
                    }
                }
            }
        };
    }
}