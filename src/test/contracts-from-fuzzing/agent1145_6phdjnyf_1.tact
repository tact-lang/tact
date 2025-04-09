struct DeepOptional {
    level1: Level1?;
}

struct Level1 {
    level2: Level2?;
}

struct Level2 {
    flag: Bool;
    txt: String;
    num: Int;
}

contract DeepOptionalTest {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            level1: Level1{
                level2: Level2{
                    flag: false,
                    txt: "deep",
                    num: 99
                }
            }
        };
    }
}
