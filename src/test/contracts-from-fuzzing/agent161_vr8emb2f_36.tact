// Contract with deeply nested struct with optionals at multiple levels

struct Level3 {
    optInt: Int?;
    optStr: String?;
}

struct Level2 {
    level3: Level3?;
    flag: Bool;
}

struct Level1 {
    level2: Level2?;
    text: String;
}

contract MultiNestedOptionals {
    root: Level1;
    init() {
        self.root = Level1{
            level2: null,
            text: "hello",
        };
    }
}
