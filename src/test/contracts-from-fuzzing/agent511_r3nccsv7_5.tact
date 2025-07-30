struct Level3 {
    p: String;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepHierarchy {
    val: Level1;

    init() {
        self.val = Level1 {
            l2: Level2 {
                l3: Level3 {
                    p: "hello"
                }
            }
        };
    }
}