// Struct with many nested structs containing many bools, ints, optionals
struct Leaf {
    a: Int;
    b: Bool;
    c: Bool?;
}
struct Node {
    l1: Leaf;
    l2: Leaf?;
    d: Int?;
}
struct Tree {
    n1: Node;
    n2: Node?;
    flag: Bool;
}

contract TestContract {
    tree: Tree;
    init() {
        self.tree = Tree{
            n1: Node{
                l1: Leaf{ a: 1, b: true, c: null },
                l2: null,
                d: 55,
            },
            n2: null,
            flag: true,
        };
    }
}
