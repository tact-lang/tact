struct Leaf { amount: Int; }

struct Branch {
    name: String;
    leaf1: Leaf?;
    leaf2: Leaf?;
}

struct Root {
    flag: Bool;
    branch: Branch?;
}

contract Blossom {
    root: Root;

    init() {
        self.root = Root{
            flag: true,
            branch: null
        };
    }
}
