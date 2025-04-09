struct Deep {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    content: Int;
}

contract DeeperNest {
    val: Deep;

    init() {
        self.val = Deep{level2: Level2{level3: Level3{content: 99}}};
    }
}