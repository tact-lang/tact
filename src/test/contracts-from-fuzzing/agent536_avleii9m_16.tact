struct Leaf {
    id: Int;
    label: String?;
}

struct Middle {
    count: Int;
    leaf: Leaf;
}

struct Root {
    ready: Bool;
    node: Middle;
}

contract DeepNestOpt {
    data: Root = Root{
        ready: false,
        node: Middle{
            count: 0,
            leaf: Leaf{id: 1, label: null}
        }
    };

    init() {
        self.data = Root{
            ready: true,
            node: Middle{count:5, leaf:Leaf{id:10, label:"X"}}
        };
    }
}