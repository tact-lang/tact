struct RecursiveTop {
    child1: RecursiveChild;
    child2: RecursiveChild;
}

struct RecursiveChild {
    val: Int;
    sibling: RecursiveSibling;
}

struct RecursiveSibling {
    v1: Int;
    v2: Int;
}

contract Test19 {
    root: RecursiveTop;

    init() {
        self.root = RecursiveTop{
            child1: RecursiveChild{val:1, sibling: RecursiveSibling{v1:10,v2:11}},
            child2: RecursiveChild{val:2, sibling: RecursiveSibling{v1:20,v2:21}},
        };
    }
}