struct Level3 {
    z: Int;
}

struct Level2 {
    y: Int;
    lvl3: Level3;
}

struct Level1 {
    x: Int;
    lvl2: Level2;
}

contract DeepLevels {
    levels: Level1;

    init() {
        self.levels = Level1{
            x: 1,
            lvl2: Level2{ y: 2, lvl3: Level3{z: 3} }
        };
    }
}
