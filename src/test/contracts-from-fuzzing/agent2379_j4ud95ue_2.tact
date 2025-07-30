struct Level3 {
    name: String;
}

struct Level2 {
    nested: Level3;
    optNested: Level3?;
}

struct Level1 {
    nested: Level2;
    optNested: Level2?;
}

contract Test {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                nested: Level3{ name: "x" },
                optNested: null,
            },
            optNested: null,
        };
    }
}