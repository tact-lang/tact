// contract with initialized persistent optional struct containing deep nesting
struct Leaf {
    value: Int?;
}

struct Node {
    child: Leaf;
    label: String;
}

struct MaybeNode {
    node: Node?;
}

contract TestContract {
    root: MaybeNode?;

    init() {
        self.root = MaybeNode{
            node: Node{
                child: Leaf{ value: null },
                label: "ok"
            }
        };
    }
}