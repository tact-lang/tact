struct Level3 {
    value: Int;
    flag: Bool;
}

struct Level2 {
    nested: Level3;
    flag2: Bool;
}

struct Level1 {
    nested: Level2;
    num: Int;
}

contract VeryDeep {
    content: Level1;

    init() {
        self.content = Level1{
            nested: Level2{
                nested: Level3{
                    value: 99,
                    flag: false,
                },
                flag2: true,
            },
            num: 77,
        };
    }
}