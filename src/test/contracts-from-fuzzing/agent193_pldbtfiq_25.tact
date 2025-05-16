struct Leaf {
    x: Int?;
    y: Bool?;
}

struct Middle {
    l: Leaf;
}

struct Root {
    m: Middle?;
}

contract OptionalTree {
    root: Root;

    init() {
        self.root = Root{m:null};
    }
}