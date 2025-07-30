struct Level3 {
    a: Int;
    b: Bool?;
}

struct Level2 {
    x: Level3;
    y: Bool;
}

struct Level1 {
    foo: Int?;
    bar: Level2;
}

contract NestedOptionals {
    s: Level1;

    init() {
        self.s = Level1{
            foo: null,
            bar: Level2{
                x: Level3{
                    a: 1,
                    b: true,
                },
                y: false,
            }
        };
    }
}
