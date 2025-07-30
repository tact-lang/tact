struct LargeNested {
    level1: Level1;
}

struct Level1 {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    level4: Level4;
}

struct Level4 {
    num: Int;
    text: String;
}

contract DeepUse {
    val: LargeNested;

    init() {
        self.val = LargeNested{
            level1: Level1{
                level2: Level2{
                    level3: Level3{
                        level4: Level4{
                            num:123,
                            text:"hello",
                        }
                    }
                }
            }
        };
    }
}
