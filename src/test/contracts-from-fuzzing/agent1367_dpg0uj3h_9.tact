struct Level3 {
    x: Int?;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract ChainNested {
    data: Level1;

    init() {
        self.data = Level1{
            inner: Level2{
                inner: Level3{
                    x: null,
                },
            },
        };
    }
}