struct Level3 {
    flag: Bool;
    text: String;
}

struct Level2 {
    nested: Level3;
    value: Int?;
}

struct Level1 {
    nested: Level2;
    enabled: Bool;
}

contract MultiLevel {
    stash: Level1;
    init() {
        self.stash = Level1{
            nested: Level2{
                nested: Level3{
                    flag: false,
                    text: "nest3"
                },
                value: null
            },
            enabled: true
        };
    }
}