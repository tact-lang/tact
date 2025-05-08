struct Level1 {
    a: Int;
}

struct Level2 {
    l1: Level1;
}

struct Level3 {
    l2: Level2;
}

struct Level4 {
    l3: Level3;
}

contract DeepFour {
    data: Level4;

    init() {
        self.data = Level4 { l3: Level3 { l2: Level2 { l1: Level1{a:42} } } };
    }
}