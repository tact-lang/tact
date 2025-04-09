struct DeeplyNested {
    level1: Level2;
}

struct Level2 {
    level2: Level3;
}

struct Level3 {
    level3: Level4;
}

struct Level4 {
    value: Int;
    flag: Bool;
    text: String;
}

contract UltraNested {
    root: DeeplyNested;

    init() {
        self.root = DeeplyNested{
            level1: Level2{
                level2: Level3{
                    level3: Level4{
                        value: 7,
                        flag: true,
                        text: "end"
                    }
                }
            }
        };
    }
}