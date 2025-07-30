struct Leaf {
    x: Int?;
    y: String?;
}

struct Branch {
    name: String;
    leaf1: Leaf;
    leaf2: Leaf?;
}

struct DeepTree {
    rootNote: String;
    left: Branch;
    right: Branch?;
}

contract TestContract {
    state: DeepTree = DeepTree{
        rootNote: "genesis",
        left: Branch{
            name: "L",
            leaf1: Leaf{ x:null, y:null },
            leaf2: null
        },
        right: null
    };

    receive() {
        let _ = self.state.left.leaf1.y;
    }
}