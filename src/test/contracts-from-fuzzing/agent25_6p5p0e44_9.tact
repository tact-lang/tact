struct Leaf {
    a: Int;
    b: Bool?;
    s: String;
}

struct Branch {
    left: Leaf?;
    right: Leaf;
}

struct Root {
    main: Branch?;
    alt: Branch;
}

contract DeepNestOpts {
    content: Root;

    init() {
        self.content = Root{
            main: null,
            alt: Branch{
                left: null,
                right: Leaf{ a: 5, b: null, s: "x" }
            }
        };
    }
}
