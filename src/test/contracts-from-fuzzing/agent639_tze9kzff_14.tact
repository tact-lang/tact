struct Leaf {
    val: Int = 42;
}

struct Branch {
    leaf: Leaf;
    flag: Bool = true;
}

struct Node {
    branch: Branch?;
    label: String?;
}

contract OptMix {
    node: Node?;

    init() {
        self.node = null;
    }

    receive() {}
}