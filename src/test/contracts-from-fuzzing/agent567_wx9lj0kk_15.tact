// very deeply nested struct tree (4 levels)
struct Level4 {
    value: Int = 12345;
}

struct Level3 {
    sub: Level4;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    inner: Level2;
}

contract DeepContract {
    root: Level1;
    init() {
        self.root = Level1 {
            inner: Level2 {
                nested: Level3 {
                    sub: Level4 {
                        value: 999999
                    }
                }
            }
        };
    }
}
