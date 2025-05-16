struct Level3 {
    v: Int;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2a: Level2;
    l2b: Level2;
}

contract DeepCombo {
    f: Level1;

    init() {
        self.f = Level1{
            l2a: Level2{ l3a: Level3{v:1}, l3b: Level3{v:2} },
            l2b: Level2{ l3a: Level3{v:3}, l3b: Level3{v:4} }
        };
    }
}