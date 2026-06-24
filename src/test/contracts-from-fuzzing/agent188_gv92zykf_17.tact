contract ChainNested {
    data: Level1;
    init() {
        self.data = Level1{
            next: Level2{
                next: Level3{
                    next: Level4{
                        val: 777
                    }
                }
            }
        };
    }
}

struct Level1 {
    next: Level2;
}

struct Level2 {
    next: Level3;
}

struct Level3 {
    next: Level4;
}

struct Level4 {
    val: Int;
}
