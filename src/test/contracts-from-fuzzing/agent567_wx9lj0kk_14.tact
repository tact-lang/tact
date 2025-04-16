// test contract field optional of deeply nested optional struct containing optionals
struct Leaf {
    z: Int?;
    s: String?;
}

struct Node {
    leaf: Leaf?;
    more: Int?;
}

contract MegaOption {
    optNode: Node?;
    init() {
        self.optNode = Node{
            leaf: Leaf{
               z: 999,
               s: null,
            },
            more: null,
        };
    }
}
