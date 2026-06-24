struct Leaf {
    value: Int as uint16;
    desc: String?;
}

struct NodeB {
    leaf: Leaf?;
    code: Int as uint4;
}

struct NodeA {
    node: NodeB?;
    name: String;
}

struct Root {
    a: NodeA?;
    flag: Bool;
    msg: String?;
}

contract TestContract {
    tree: Root;

    init() {
        self.tree = Root{
            a: null,
            flag: false,
            msg: null
        };
    }
}