struct Level3 {
    xx: Int;
}

struct Level2 {
    lev3: Level3;
}

struct Level1 {
    lev2: Level2;
}

contract DeepNest {
    x: Level1;

    init() {
        self.x = Level1{lev2: Level2{lev3: Level3{xx: 101}}};
    }
}