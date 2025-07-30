struct Level3 {
    val: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    nested: Level2;
    opt: Int?;
}

contract Test {
    storage: Level1;

    init() {
        self.storage = Level1{
            nested: Level2{
                inner: Level3{ val: 100 }
            },
            opt: 42,
        };
    }
}
