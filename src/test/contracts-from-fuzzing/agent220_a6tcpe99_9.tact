struct Level2 {
    foo: Int?;
    bar: Int = 1;
}

struct Level1 {
    l2: Level2?;
    s: String?;
}

contract DeepNestOpt {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                foo: 42,
                bar: 100
            }
        };
    }

    receive() {}
}