struct Level3 {
    val: Int;
}

struct Level2 {
    level3: Level3;
}

struct Level1 {
    level2: Level2;
}

contract InitPartial {
    data: Level1;

    init() {
        self.data = Level1 {
            level2: Level2 {
                level3: Level3 {
                    val: 5
                }
            }
        };
    }
}