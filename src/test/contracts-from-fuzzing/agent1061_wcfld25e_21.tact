// deeply nested multiple layers of structs. Goal: stress serialization layout
struct Leaf { val: Int; }
struct Branch {
    leaf1: Leaf; leaf2: Leaf; midval: Int;
}
struct Tree {
    branch1: Branch; branch2: Branch; rootVal: Int;
}
struct Forest {
    tree1: Tree; tree2: Tree; forestVal: Int;
}
contract Test {
    f: Forest;
    init() {
        self.f = Forest{
            tree1: Tree{
                branch1: Branch{ leaf1: Leaf{val:1}, leaf2: Leaf{val:2}, midval:3 },
                branch2: Branch{ leaf1: Leaf{val:4}, leaf2: Leaf{val:5}, midval:6 },
                rootVal: 7
            },
            tree2: Tree{
                branch1: Branch{ leaf1: Leaf{val:8}, leaf2: Leaf{val:9}, midval:10 },
                branch2: Branch{ leaf1: Leaf{val:11}, leaf2: Leaf{val:12}, midval:13 },
                rootVal: 14
            },
            forestVal: 15
        };
    }
}