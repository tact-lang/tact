struct Level2 {
    foo: Int;
    bar: Bool;
}

struct Level1 {
    nested: Level2;
    flag: Bool;
}

contract Test {
    saved: Level1;

    init() {
        self.saved = Level1{
            nested: Level2{
                foo: 123,
                bar: false,
            },
            flag: true,
        };
    }
}