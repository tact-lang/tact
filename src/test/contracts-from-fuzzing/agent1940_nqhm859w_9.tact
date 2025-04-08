struct Level3 {
    flag: Bool;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepNest4 {
    root: Level1;

    init() {
        self.root = Level1{ l2: Level2{ l3a: Level3{flag:true}, l3b: Level3{flag:false} } };
    }
}