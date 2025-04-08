// Large deeply nested struct tree to stress nesting
struct NodeLevel4 {
    leaf: Int;
}

struct NodeLevel3 {
    l1: NodeLevel4;
    l2: NodeLevel4;
}

struct NodeLevel2 {
    n1: NodeLevel3;
    n2: NodeLevel3;
}

struct NodeLevel1 {
    branch1: NodeLevel2;
    branch2: NodeLevel2;
}

contract DeepTree {
    root: NodeLevel1 = NodeLevel1{
        branch1: NodeLevel2{
            n1: NodeLevel3{ l1: NodeLevel4{ leaf: 1 }, l2: NodeLevel4{ leaf: 2 } },
            n2: NodeLevel3{ l1: NodeLevel4{ leaf: 3 }, l2: NodeLevel4{ leaf: 4 } },
        },
        branch2: NodeLevel2{
            n1: NodeLevel3{ l1: NodeLevel4{ leaf: 5 }, l2: NodeLevel4{ leaf: 6 } },
            n2: NodeLevel3{ l1: NodeLevel4{ leaf: 7 }, l2: NodeLevel4{ leaf: 8 } },
        },
    };

    init() {
        self.root = NodeLevel1{
            branch1: NodeLevel2{
                n1: NodeLevel3{ l1: NodeLevel4{ leaf: 11 }, l2: NodeLevel4{ leaf: 12 } },
                n2: NodeLevel3{ l1: NodeLevel4{ leaf: 13 }, l2: NodeLevel4{ leaf: 14 } },
            },
            branch2: NodeLevel2{
                n1: NodeLevel3{ l1: NodeLevel4{ leaf: 15 }, l2: NodeLevel4{ leaf: 16 } },
                n2: NodeLevel3{ l1: NodeLevel4{ leaf: 17 }, l2: NodeLevel4{ leaf: 18 } },
            },
        };
    }
}