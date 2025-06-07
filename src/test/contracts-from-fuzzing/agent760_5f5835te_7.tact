struct Leaf {
    leafVal: String?;
}

struct Mid {
    midVal: Int;
    leaf: Leaf?;
}

struct Root {
    msg: String;
    mid: Mid?;
}

contract OptionalNested {
    root: Root? = null;

    init() {
        self.root = Root{
            msg: "root",
            mid: Mid{
                midVal: 42,
                leaf: Leaf{
                    leafVal: null,
                },
            },
        };
    }
}