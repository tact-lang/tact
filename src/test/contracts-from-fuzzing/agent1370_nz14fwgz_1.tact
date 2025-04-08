struct Level3 {
    f: Int;
}

struct Level2 {
    a: Int;
    b: Bool;
    c: String;
    e: Level3;
}

struct Level1 {
    x: Level2;
    y: Int?;
}

contract DeepNestedTest {
    nested: Level1;

    init() {
        self.nested = Level1{
            x: Level2{
                a: 1,
                b: true,
                c: "hi",
                e: Level3{f: 10},
            },
            y: null,
        };
    }
}