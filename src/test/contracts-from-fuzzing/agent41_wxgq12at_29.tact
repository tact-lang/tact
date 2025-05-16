struct Leaf {
    flag: Bool;
}

struct Mid {
    left: Leaf;
    right: Leaf;
}

struct Top {
    one: Mid;
    two: Mid;
}

contract DeepBinaryTree {
    root: Top;

    init() {
        self.root = Top{
            one: Mid{
                left: Leaf{flag: true},
                right: Leaf{flag: false},
            },
            two: Mid{
                left: Leaf{flag: true},
                right: Leaf{flag: true},
            },
        };
    }
}
