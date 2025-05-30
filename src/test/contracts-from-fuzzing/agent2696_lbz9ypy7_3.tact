struct Level3 {
    f3: Int;
    g3: Bool;
}

struct Level2 {
    f2: Level3;
}

struct Level1 {
    f1: Level2;
}

contract TripleNest {
    deep: Level1;

    init() {
        self.deep = Level1{
            f1: Level2{
                f2: Level3{
                    f3: 123,
                    g3: true,
                }
            }
        };
    }
}