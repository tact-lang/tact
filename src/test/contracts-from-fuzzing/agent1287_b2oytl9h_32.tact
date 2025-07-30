struct Leaf { x: Int = 7; }

struct Node1 { leaf: Leaf? = null; }
struct Node2 { leaf: Leaf? = null; }
struct Node3 { leaf: Leaf? = null; }
struct Node4 { leaf: Leaf? = null; }

struct Tree {
    branch1: Node1? = null;
    branch2: Node2? = null;
    branch3: Node3? = null;
    branch4: Node4? = null;
}

contract GiantNest {
    t: Tree = Tree{};
}