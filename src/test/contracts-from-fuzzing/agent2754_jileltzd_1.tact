struct Level3 {
    z: String;
}

struct Level2 {
    y: Int?;
    nested: Level3;
}

struct Level1 {
    x: Int;
    middle: Level2;
}

contract DeepNestedTest {
    root: Level1;

    init() {
        self.root = Level1{
            x: 42,
            middle: Level2{
                y: null,
                nested: Level3{
                    z: "deep"
                }
            }
        };
    }
}
