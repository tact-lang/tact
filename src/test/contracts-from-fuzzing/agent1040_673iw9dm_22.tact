struct Leaf {
    val1: Int;
    val2: Bool?;
}

struct Node {
    left: Leaf;
    right: Leaf?;
    tag: String;
}

struct Root {
    main: Node;
    alt: Node?;
    count: Int;
}

contract TestContract {
    tree: Root;

    init() {
        self.tree = Root{
            main: Node{
                left: Leaf{ val1: 7, val2: true },
                right: null,
                tag: "main"
            },
            alt: Node{
                left: Leaf{ val1: 8, val2: null },
                right: Leaf{ val1: 9, val2: false },
                tag: "alt"
            },
            count: 2
        };
    }
}