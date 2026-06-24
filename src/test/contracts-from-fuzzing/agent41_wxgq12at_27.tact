struct Leafs {
    one: Int?;
    two: Bool?;
}

struct Node {
    left: Leafs?;
    right: Leafs?;
}

contract TreeShapedOptionals {
    root: Node;

    init() {
        self.root = Node {
            left: null,
            right: Leafs{
                one: null,
                two: true,
            },
        };
    }
}
