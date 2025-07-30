struct Leaf {
    a: Int;
    b: String;
}

struct Node1 {
    l1: Leaf;
    l2: Leaf;
}

struct Node2 {
    n: Node1;
    l3: Leaf;
}

contract TreeLike {
    root: Node2;
    init() {
        self.root = Node2{
            n: Node1{l1:Leaf{a:1,b:""}, l2:Leaf{a:2,b:""}},
            l3: Leaf{a:3,b:""}
        };
    }
}