struct Leaf {
    bigInt: Int as int257;
    bigUInt: Int as uint256;
}

struct Mid {
    leaf1: Leaf;
    leaf2: Leaf;
}

contract TestContract {
    tree: Mid;

    init() {
        self.tree = Mid{
            leaf1: Leaf{bigInt:0, bigUInt:0},
            leaf2: Leaf{bigInt:-1, bigUInt:1},
        };
    }
}