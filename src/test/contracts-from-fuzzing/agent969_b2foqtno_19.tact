struct Leaf {
    flag: Bool = false;
    data: Int?;
}

struct Node {
    leaf: Leaf;
    label: String = "";
}

contract PersistComplexNest {
    data: Node;

    init() {
        self.data = Node{
            leaf: Leaf{
                flag: true,
                data: null
            },
            label: "label"
        };
    }
}
