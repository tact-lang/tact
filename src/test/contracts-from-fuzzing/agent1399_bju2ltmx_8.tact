struct Leaf {
    z: Int = 10;
}

struct Node {
    leafOpt: Leaf?;
    flag: Bool = true;
}

contract TestContract {
    nodeVar: Node = Node{
        leafOpt: null,
        flag: false
    };
}