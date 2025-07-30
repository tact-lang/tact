struct DeepNest {
    sub: Level1;
}

struct Level1 {
    sub: Level2;
}

struct Level2 {
    sub: Level3;
}

struct Level3 {
     val: String;
}

contract VeryDeep {
    all: DeepNest;
    init() {
        self.all = DeepNest{
            sub: Level1{
                sub: Level2{
                    sub: Level3{
                        val: "deep"
                    }
                }
            }
        };
    }
}
