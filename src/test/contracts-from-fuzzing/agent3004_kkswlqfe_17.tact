struct Deep {
    level: Int;
    node: Node;
}

struct Node {
    val: Int;
    next: NextNode;
}

struct NextNode {
    flag: Bool;
}

contract Nesting3 {
    deep: Deep;

    init() {
        self.deep = Deep{
            level: 1,
            node: Node{ val: 2, next: NextNode{ flag:true } }
        };
    }
}