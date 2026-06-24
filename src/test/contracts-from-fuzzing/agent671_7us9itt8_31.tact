struct Leaf {
    a: Int;
    b: Bool?;
}

struct SubNode {
    id: Int;
    leaf: Leaf;
    label: String;
}

struct Node {
    sub1: SubNode;
    sub2: SubNode;
    flag: Bool;
}

contract TestContract {
    root: Node;

    init() {
        self.root = Node{
            sub1: SubNode{ id: 1, leaf: Leaf{ a: 11, b: null }, label: "one" },
            sub2: SubNode{ id: 2, leaf: Leaf{ a: 22, b: true }, label: "two" },
            flag: false
        };
    }
}