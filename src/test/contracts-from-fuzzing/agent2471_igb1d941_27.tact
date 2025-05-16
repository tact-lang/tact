struct Level3 {
    x: Int;
}

struct Level2 {
    l3opt: Level3?;
}

struct Level1 {
    l2: Level2;
}

contract OptDeepNested {
    l1: Level1;

    init() {
        self.l1 = Level1{
            l2: Level2{
                l3opt: null,
            },
        };
    }
}