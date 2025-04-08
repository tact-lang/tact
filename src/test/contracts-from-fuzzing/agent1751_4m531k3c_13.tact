struct Leaf {
    val: Int?;
}

struct Branch {
    leaf: Leaf;
    flag: Bool;
}

struct Root {
    branch: Branch?;
    num: Int;
    txt: String?;
}

contract ComplexPersist {
    state: Root;

    init() {
        self.state = Root{
            branch: Branch{
                leaf: Leaf{
                    val: null
                },
                flag: true
            },
            num: 99,
            txt: null,
        };
    }

    receive() {}
}