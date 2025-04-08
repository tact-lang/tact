struct Level3 {
    v: Int?;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract DeepHierarchy {
    root: Level1;

    init() {
        self.root = Level1{
            l2a: Level2{
                l3a: Level3{v: null},
                l3b: Level3{v: 3}
            },
            l2b: Level2{
                l3a: Level3{v: 4},
                l3b: Level3{v: null}
            }
        };
    }
}