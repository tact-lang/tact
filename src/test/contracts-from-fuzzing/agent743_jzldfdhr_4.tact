struct Level3 {
    x3: Int;
    b3: Bool;
}

struct Level2 {
    x2: Int;
    nested3: Level3;
}

struct Level1 {
    x1: Int;
    nested2: Level2;
}

contract DeepNest {
    state: Level1;

    init() {
        self.state = Level1{
            x1: 1,
            nested2: Level2{
                x2: 2,
                nested3: Level3{
                    x3: 3,
                    b3: true
                }
            }
        };
    }
}