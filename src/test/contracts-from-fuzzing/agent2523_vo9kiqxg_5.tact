struct Leaf {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
}

struct Branch {
    leafA: Leaf;
    leafB: Leaf;
}

struct Tree {
    left: Branch;
    right: Branch;
}

contract WideNested {
    tree: Tree;

    init() {
        self.tree = Tree {
            left: Branch {
                leafA: Leaf{intVal:1,boolVal:true,strVal:"a"},
                leafB: Leaf{intVal:2,boolVal:false,strVal:"b"},
            },
            right: Branch {
                leafA: Leaf{intVal:3,boolVal:true,strVal:"c"},
                leafB: Leaf{intVal:4,boolVal:false,strVal:"d"},
            }
        };
    }
}
