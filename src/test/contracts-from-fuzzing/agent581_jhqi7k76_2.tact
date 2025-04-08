struct DeeplyNested {
    d: Level1;
}

struct Level1 {
    l2: Level2;
}

struct Level2 {
    l3: Level3;
}

struct Level3 {
    value: Int;
}

contract Test {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            d: Level1{
                l2: Level2{
                    l3: Level3{ value: 42 }
                }
            }
        };
    }
}
