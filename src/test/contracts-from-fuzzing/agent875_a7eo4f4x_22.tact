struct LevelOne {
    flag: Bool;
    nested: LevelTwo;
}

struct LevelTwo {
    str: String;
    optLevel3: LevelThree?;
}

struct LevelThree {
    value: Int?;
}

contract OptDeepContract {
    data: LevelOne;

    init() {
        self.data = LevelOne{
            flag: true,
            nested: LevelTwo{
                str: "xyz",
                optLevel3: LevelThree{
                    value:null
                }
            }
        };
    }
}