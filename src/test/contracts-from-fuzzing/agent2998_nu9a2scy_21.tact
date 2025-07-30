struct MultiLevel {
    l1: Level1;
}

struct Level1 {
    l2: Level2;
}

struct Level2 {
    l3: Level3;
}

struct Level3 {
    flag: Bool;
}

contract MultiLevelContract {
    nested: MultiLevel;

    init() {
        self.nested = MultiLevel{
            l1: Level1{
                l2: Level2{
                    l3: Level3{
                        flag: true,
                    },
                },
            },
        };
    }
}