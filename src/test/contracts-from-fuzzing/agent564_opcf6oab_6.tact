struct Level3 {
    f: Int;
    g: Bool?;
}

struct Level2 {
    c: Int;
    d: Level3;
}

struct Level1 {
    a: Int;
    b: Level2;
}

contract DeepNestingTest {
    root: Level1;

    init() {
        self.root = Level1{
            a: 1,
            b: Level2{
                c: 2,
                d: Level3{
                    f: 3,
                    g: null,
                },
            },
        };
    }
}
