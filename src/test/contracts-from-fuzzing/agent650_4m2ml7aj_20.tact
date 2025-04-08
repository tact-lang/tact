// deeply nested non-optional structs with mixed primitives
struct SLeaf {
    a: Int;
    b: Bool;
}

struct SNode {
    left: SLeaf;
    right: SLeaf;
}

struct SRoot {
    lnode: SNode;
    rnode: SNode;
}

contract TestContract {
    root: SRoot;

    init() {
        self.root = SRoot{
            lnode: SNode{
                left: SLeaf { a:1, b:true },
                right: SLeaf { a:2, b:false }
            },
            rnode: SNode{
                left: SLeaf { a:3, b:true },
                right: SLeaf { a:4, b:false }
            }
        };
    }
}
