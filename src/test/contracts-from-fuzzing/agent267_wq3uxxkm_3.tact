struct Level2 {
    data: Int?;
}

struct Level1 {
    num: Int;
    inner: Level2;
}

contract DeepNest {
    nested: Level1;

    init() {
        self.nested = Level1{
            num: 10,
            inner: Level2{ data: 42 },
        };
    }
}