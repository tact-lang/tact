struct Level1 {
    sub: Level2;
}

struct Level2 {
    sub: Level3;
}

struct Level3 {
    sub: Level4;
}

struct Level4 {
    val: Int;
}

contract ManyNestLevels {
    root: Level1;

    init() {
        self.root = Level1{
            sub: Level2{
                sub: Level3{
                    sub: Level4{
                        val: 1234
                    }
                }
            }
        };
    }
}
