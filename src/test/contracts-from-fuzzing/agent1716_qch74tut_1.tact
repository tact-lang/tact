struct Level3 { val: Int; }

struct Level2 {
    a: Level3;
    b: Int?;
}

struct NestedTest {
    x: Int;
    y: Level2;
}

contract DeepNestedTest {
    storage: NestedTest;

    init() {
        self.storage = NestedTest{
            x: 1,
            y: Level2{
                a: Level3{ val: 42 },
                b: 10
            }
        };
    }
}
