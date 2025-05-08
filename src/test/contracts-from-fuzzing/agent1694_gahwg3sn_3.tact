struct Level3 {
    deepValue: Int?;
}

struct Level2 {
    level3: Level3;
    message: String;
}

struct Level1 {
    lvl2: Level2;
    flag: Bool;
}

contract DeepNest {
    content: Level1;

    init() {
        self.content = Level1{
            lvl2: Level2{
                level3: Level3{ deepValue: null },
                message: "hi"
            },
            flag: true
        };
    }
}