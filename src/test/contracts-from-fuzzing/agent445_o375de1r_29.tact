// Wide struct with many optional nested structs with defaults
struct Leaf {
    payload: Int? = null;
}

struct Node {
    l1: Leaf? = null;
    l2: Leaf? = null;
    l3: Leaf? = null;
    l4: Leaf? = null;
    l5: Leaf? = null;
    l6: Leaf? = null;
    l7: Leaf? = null;
    l8: Leaf? = null;
    l9: Leaf? = null;
}

contract WideOptionalTree {
    root: Node = Node{};
}
