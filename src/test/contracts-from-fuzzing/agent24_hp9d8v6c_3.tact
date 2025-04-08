struct Level3 {
    a: Int;
    b: Bool;
}

struct Level2 {
    x: Int;
    inner: Level3;
    opt: Bool?;
}

struct Level1 {
    y: Int;
    nested: Level2;
}

contract DeepNestTest {
    s: Level1;

    init() {
        self.s = Level1{
            y: 7,
            nested: Level2{
                x: 8,
                inner: Level3{
                    a: 9,
                    b: true,
                },
                opt: null,
            },
        };
    }
}