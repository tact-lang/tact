struct Leaf {
    field: Int;
}

struct Node {
    left: Leaf?;
    right: Leaf?;
}

struct TopTree {
    node1: Node?;
    node2: Node?;
    flag: Bool;
}

contract Forest {
    t: TopTree;

    init() {
        self.t = TopTree{
            node1: null,
            node2: Node{left:Leaf{field:1}, right:null},
            flag: true
        };
    }
}