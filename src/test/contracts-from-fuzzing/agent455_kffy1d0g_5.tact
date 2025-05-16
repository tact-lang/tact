struct Level3 {
    x: Int;
}

struct Level2 {
    next: Level3;
}

struct Level1 {
    next: Level2;
}

contract ChainNested {
    data: Level1;
    init() {
        self.data = Level1{
            next: Level2{
                next: Level3{
                    x: 21,
                },
            },
        };
    }
}