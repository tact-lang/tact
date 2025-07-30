struct Leaf {
    x: Int?;
    hello: String?;
    flag: Bool?;
    addr: Address?;
}

struct Middle {
    leaf: Leaf;
    val: Int;
}

contract Test {
    root: Middle;

    init() {
        self.root = Middle{
            leaf: Leaf{
                x: 1,
                hello: "hi",
                flag: null,
                addr: null
            },
            val: 42
        };
    }
}
