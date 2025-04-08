// Large struct of nested structs with primitive fields
struct Leaf {
    i: Int;
    s: String;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

struct Root {
    a: Node;
    b: Node;
}

contract LargeTree {
    tree: Root;

    init() {
        self.tree = Root{
            a: Node{left: Leaf{i:1,s:"L"}, right: Leaf{i:2,s:"R"}},
            b: Node{left: Leaf{i:3,s:"L"}, right: Leaf{i:4,s:"R"}}
        };
    }
}
