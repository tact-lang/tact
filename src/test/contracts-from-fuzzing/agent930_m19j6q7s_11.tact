struct Leaf {
    flag: Bool;
}

struct Mid {
    leaf1: Leaf;
    leaf2: Leaf;
    note: String?;
}

struct Top {
    mid1: Mid;
    mid2: Mid;
}

contract NestedTwins {
    data: Top;

    init() {
        self.data = Top{
            mid1: Mid{
                leaf1: Leaf{flag: true},
                leaf2: Leaf{flag: false},
                note: null
            },
            mid2: Mid{
                leaf1: Leaf{flag: false},
                leaf2: Leaf{flag: true},
                note: "hello"
            }
        };
    }
}