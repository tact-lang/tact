struct Deep {
    s1: Mid?;
}

struct Mid {
    s2: Leaf?;
}

struct Leaf {
    num: Int?;
}

contract TestContract {
    root: Deep;

    init() {
        self.root = Deep{
            s1: Mid{
                s2: Leaf{
                    num: null
                }
            }
        };
    }
}