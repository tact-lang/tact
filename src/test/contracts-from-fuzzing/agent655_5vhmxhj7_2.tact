struct DeeplyNested {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    num: Int;
    txt: String;
    flag: Bool;
}

contract TestContract {
    state: DeeplyNested;

    init() {
        self.state = DeeplyNested{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        num: 1,
                        txt: "hi",
                        flag: false,
                    }
                }
            }
        };
    }
}
