// test a deeply nested chain with optionals at several levels

struct Level4 { v4: Int? }

struct Level3 { v3: Int?; next: Level4 }

struct Level2 { v2: Int; next: Level3 }

struct Level1 { v1: Int?; next: Level2 }

contract DeepOpts {
    data: Level1;

    init() {
        self.data = Level1 {
            v1: null,
            next: Level2 {
                v2: 22,
                next: Level3 {
                    v3: null,
                    next: Level4 { v4: 44 }
                }
            }
        };
    }
}
