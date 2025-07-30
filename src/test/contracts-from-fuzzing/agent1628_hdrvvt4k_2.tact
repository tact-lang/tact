struct Level1 {
    f1: Int;
    f2: Bool;
    f3: Level2;
}

struct Level2 {
    g1: Int;
    g2: Bool;
    g3: Level3;
}

struct Level3 {
    h1: Int;
    h2: Bool;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            f1: 1,
            f2: true,
            f3: Level2{
                g1: 2,
                g2: false,
                g3: Level3{
                    h1: 3,
                    h2: true
                }
            }
        };
    }
}