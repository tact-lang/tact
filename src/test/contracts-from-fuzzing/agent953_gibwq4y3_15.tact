struct Leaf {
    v: Int = 99;
}

struct Node2 {
    child: Leaf? = null;
}

struct Node1 {
    child: Node2 = Node2{};
}

contract Test {
    root: Node1 = Node1{};
}