struct Level4 {
    val: Int;
}

struct Level3 {
    sub: Level4;
}

struct Level2 {
    sub: Level3;
}

struct Level1 {
    sub: Level2;
}

contract UltraDeep {
    data: Level1;
    init() {
        self.data = Level1{
            sub: Level2{
                sub: Level3{
                    sub: Level4{
                        val: 999
                    }
                }
            }
        };
    }
}