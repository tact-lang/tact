struct Level3 {
    ok: Int;
}

struct Level2 {
    foo: Bool;
    bar: Level3;
}

struct Level1 {
    msg: String;
    nested: Level2;
}

contract NestedContract {
    stuff: Level1;

    init() {
        self.stuff = Level1{
            msg: "hi",
            nested: Level2{
                foo: true,
                bar: Level3{ ok: 42 }
            }
        };
    }
}