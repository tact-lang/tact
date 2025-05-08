struct Level3 {
    q: Int;
}

struct Level2 {
    p: Level3;
    msg: String?;
}

struct Level1 {
    foo: Level2;
    bar: Bool;
}

contract DeepNesting {
    nested: Level1;
    init() {
        self.nested = Level1{
            foo: Level2{
                p: Level3{ q:123 },
                msg: "hello"
            },
            bar: false
        };
    }
}