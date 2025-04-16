struct Deep {
    level3: Bool;
}

struct Mid {
    level2: Deep;
}

struct Top {
    level1: Mid;
}

contract TestContract {
    nested: Top;

    init() {
        self.nested = Top{
            level1: Mid{
                level2: Deep{
                    level3: true
                }
            }
        };
    }
}
