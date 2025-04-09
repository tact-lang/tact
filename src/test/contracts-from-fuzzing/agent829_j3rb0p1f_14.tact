struct Level3 {
    deepVal: Int;
}

struct Level2 {
    next: Level3;
}

struct Level1 {
    next: Level2;
}

contract Chain {
    storage: Level1;

    init() {
        self.storage = Level1{
            next: Level2{
                next: Level3{
                    deepVal: 123,
                }
            }
        };
    }
}