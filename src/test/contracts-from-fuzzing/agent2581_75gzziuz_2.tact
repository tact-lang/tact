struct Deep {
    level3: Bool;
}

struct Mid {
    level2: Deep;
}

struct Top {
    level1: Mid;
}

contract DeepNested {
    val: Top;

    init() {
        self.val = Top{
            level1: Mid{
                level2: Deep{
                    level3: true
                }
            }
        };
    }
}
