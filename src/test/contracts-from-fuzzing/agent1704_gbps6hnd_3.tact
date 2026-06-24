struct DeeplyNested {
    lvl1: Level1;
}

struct Level1 {
    lvl2: Level2;
}

struct Level2 {
    lvl3: Level3;
}

struct Level3 {
    flag: Bool;
}

contract DeepNestTest {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            lvl1: Level1{
                lvl2: Level2{
                    lvl3: Level3{
                        flag: true,
                    },
                },
            },
        };
    }
}