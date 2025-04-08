struct Leaf {
    a: Int;
}

struct Middle {
    x: Leaf;
    y: Leaf;
}

struct Root {
    m: Middle;
    optionalMiddle: Middle?;
}

contract OptionalDeepNested {
    root: Root;

    init() {
        self.root = Root {
            m: Middle {
                x: Leaf { a: 1 },
                y: Leaf { a: 2 }
            },
            optionalMiddle: null
        };
    }
}