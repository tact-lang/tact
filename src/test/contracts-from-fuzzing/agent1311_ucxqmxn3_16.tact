struct DeepAndWide {
    n1: Node;
    n2: Node;
    n3: Node;
    n4: Node;
    n5: Node;
}

struct Node {
    left: Leaf;
    right: Leaf;
}

struct Leaf {
    flag: Bool;
    value: Int;
}

contract TestContract {
    tree: DeepAndWide;

    init() {
        self.tree = DeepAndWide{
            n1: Node{ left: Leaf{flag:true,value:1}, right: Leaf{flag:false,value:2} },
            n2: Node{ left: Leaf{flag:true,value:3}, right: Leaf{flag:false,value:4} },
            n3: Node{ left: Leaf{flag:false,value:5}, right: Leaf{flag:true,value:6} },
            n4: Node{ left: Leaf{flag:true,value:7}, right: Leaf{flag:false,value:8} },
            n5: Node{ left: Leaf{flag:false,value:9}, right: Leaf{flag:true,value:10} },
        };
    }
}
