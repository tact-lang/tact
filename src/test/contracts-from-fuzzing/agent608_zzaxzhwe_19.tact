struct Leaf {
    v: Int;
}

struct Node1 {
    leaf: Leaf;
}

struct Node2 {
    mid: Node1;
}

struct Root {
    top: Node2;
}

contract Test {
    data: Root = Root{top: Node2{mid: Node1{leaf: Leaf{v:42}}}};
}
