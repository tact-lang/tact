struct Leaves {
    val1: Int;
    val2: Bool;
    val3: String;
}

struct Branch {
    left: Leaves;
    right: Leaves;
    opt: Bool?;
}

struct Node {
    branch1: Branch;
    branch2: Branch;
    flag: Bool;
}

contract TreeShape {
    node: Node;

    init() {
        self.node = Node{
            branch1: Branch{
                left: Leaves{ val1: 1, val2: true, val3: "l1" },
                right: Leaves{ val1: 2, val2: false, val3: "r1" },
                opt: null
            },
            branch2: Branch{
                left: Leaves{ val1: 3, val2: true, val3: "l2" },
                right: Leaves{ val1: 4, val2: false, val3: "r2" },
                opt: true
            },
            flag: true
        };
    }
}
