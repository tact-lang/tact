struct Level3 {
    leaf: Int;
}

struct Level2 {
    child: Level3;
}

struct Level1 {
    child: Level2;
}

contract DeepNestedStructs {
    root: Level1;
    init() {
        self.root = Level1 {
            child: Level2 {
                child: Level3 {
                    leaf: 42
                }
            }
        };
    }
}
