struct Leaf {
    a: Int;
    b: Bool;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Node {
    main: Branch;
    aux: Branch?;
    label: String;
}

contract TestContract {
    tree: Node;

    init() {
        self.tree = Node{
            main: Branch{
                left: Leaf{ a: 1, b: true },
                right: null,
            },
            aux: null,
            label: "root",
        };
    }
}