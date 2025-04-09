struct Level3 {
    flag: Bool;
}

struct Level2 {
    lvl3: Level3;
}

struct Level1 {
    lvl2: Level2;
}

contract DeepBool {
    root: Level1;

    init() {
        self.root = Level1{lvl2: Level2{lvl3: Level3{flag: true}}};
    }
}
