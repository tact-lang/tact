struct Level3 {
    v: Int;
}

struct Level2 {
    inner: Level3?;
}

struct Level1 {
    sub: Level2?;
}

contract DeepOptionals {
    root: Level1?;

    init() {
        self.root = Level1{
            sub: Level2{
                inner: Level3{v: 123},
            },
        };
    }
}