struct BigNested {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    level4: Level4;
}

struct Level4 {
    level5: Level5;
}

struct Level5 {
    text: String;
    num: Int;
    flag: Bool;
}

contract TestContract {
    val: BigNested = BigNested{
        level2: Level2{
            level3: Level3{
                level4: Level4{
                    level5: Level5{
                        text: "deep",
                        num: 123,
                        flag: true
                    }
                }
            }
        }
    };

    init() {
        self.val = BigNested{
            level2: Level2{
                level3: Level3{
                    level4: Level4{
                        level5: Level5{
                            text: "changed",
                            num: 999,
                            flag: false
                        }
                    }
                }
            }
        };
    }
}
