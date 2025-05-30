// Large nested tree inside tree inside struct, to test nested serialization
struct Leaf { 
    x: Int = 1;
    y: Int = 2;
}

struct Branch {
    left: Leaf;
    right: Leaf;
}

struct BigTree {
    trunk: Branch;
    branch2: Branch;
    branch3: Branch;
    optBranch: Branch?;
}

struct Forest {
    tree1: BigTree;
    tree2: BigTree;
    optTree: BigTree?;
}

contract Nature {
    forest: Forest;
    init() {
        self.forest = Forest{
            tree1: BigTree{
                trunk: Branch{
                    left: Leaf{x: 3,y:4}, right: Leaf{x:5,y:6}
                },
                branch2: Branch{
                    left: Leaf{x:7,y:8}, right: Leaf{x:9,y:10}
                },
                branch3: Branch{
                    left: Leaf{x:11,y:12}, right: Leaf{x:13,y:14}
                },
                optBranch: null,
            },
            tree2: BigTree{
                trunk: Branch{
                    left: Leaf{x:15,y:16}, right: Leaf{x:17,y:18}
                },
                branch2: Branch{
                    left: Leaf{x:19,y:20}, right: Leaf{x:21,y:22}
                },
                branch3: Branch{
                    left: Leaf{x:23,y:24}, right: Leaf{x:25,y:26}
                },
                optBranch: null,
            },
            optTree: null,
        };
    }
}
