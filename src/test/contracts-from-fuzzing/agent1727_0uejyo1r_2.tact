struct Level2 {
    a: Int?;
    b: String;
}

struct Level1 {
    first: Int;
    nested: Level2;
}

contract DeepNestedTest {
    data: Level1;

    init() {
        self.data = Level1{
            first: 1,
            nested: Level2{ a: null, b: "hi" }
        };
    }
}
