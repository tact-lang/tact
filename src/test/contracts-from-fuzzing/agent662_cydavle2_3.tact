struct Level3 {
    value: Int;
}

struct Level2 {
    nested: Level3;
    alive: Bool;
}

struct Level1 {
    info: Level2;
    name: String;
}

contract DeepNestedTest {
    field: Level1;
    init() {
        self.field = Level1{
            info: Level2{
                nested: Level3{ value: 99 },
                alive: true,
            },
            name: "deep",
        };
    }
}