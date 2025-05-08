struct Level3 {
    x: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract ThreeDeep {
    deep: Level1;

    init() {
        self.deep = Level1 {
            nested: Level2 {
                nested: Level3 {
                    x: 777
                }
            }
        };
    }
}