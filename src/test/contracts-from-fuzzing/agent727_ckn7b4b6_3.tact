struct Level3 {
    deep: Int;
}

struct Level2 {
    mid: Level3;
}

struct Level1 {
    top: Level2;
}

contract NestedContract {
    field: Level1;

    init() {
        self.field = Level1 {
            top: Level2 {
                mid: Level3 {
                    deep: 42
                }
            }
        };
    }
}
