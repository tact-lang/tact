struct Leaf {
    text: String;
}

struct Middle {
    optLeaf: Leaf?;
    count: Int;
}

struct Root {
    middle: Middle;
    done: Bool;
}

contract TestContract {
    tree: Root;

    init() {
        self.tree = Root{
            middle: Middle{ optLeaf: null, count: 0 },
            done: false
        };
    }
}