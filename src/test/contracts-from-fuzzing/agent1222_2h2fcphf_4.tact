struct Level3 {
    p: Bool;
}

struct Level2 {
    q: Level3;
}

struct Level1 {
    r: Level2;
}

contract TestDeepNesting {
    s: Level1;

    init() {
        self.s = Level1{
            r: Level2{
                q: Level3{
                    p: true
                }
            }
        };
    }
}