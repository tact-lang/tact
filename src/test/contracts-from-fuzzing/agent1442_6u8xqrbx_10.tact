// fuzz test: complex nested optional inside nested struct inside persistent state

struct Leaf {
    optStr: String?;
}

struct Branch {
    node: Leaf;
    flag: Bool;
}

struct Root {
    child: Branch;
    val: Int;
}

contract TestContract {
    state: Root;
    init() {
        self.state = Root{
            child: Branch{node: Leaf{optStr: null}, flag: true},
            val: 42
        };
    }
}