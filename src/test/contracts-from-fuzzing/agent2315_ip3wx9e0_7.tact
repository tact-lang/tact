struct Level3 {
    deepValue: String?;
    deepFlag: Bool;
}

struct Level2 {
    nested3: Level3;
    number: Int?;
}

struct Level1 {
    nested2: Level2;
    text: String;
    flag: Bool?;
}

contract VeryDeepNesting {
    root: Level1;

    init() {
        self.root = Level1{
            nested2: Level2{
                nested3: Level3{
                    deepValue: "hello",
                    deepFlag: false
                },
                number: 5
            },
            text: "test",
            flag: null
        };
    }
}