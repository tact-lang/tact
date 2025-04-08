struct Level4 {
    v: Int;
}

struct Level3 {
    next: Level4;
}

struct Level2 {
    next: Level3;
}

struct Level1 {
    next: Level2;
}

contract ChainNested {
    head: Level1;

    init() {
        self.head = Level1{
            next: Level2{
                next: Level3{
                    next: Level4{
                        v: 11
                    }
                }
            }
        };
    }
}