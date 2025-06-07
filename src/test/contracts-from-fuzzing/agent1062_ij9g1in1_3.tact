struct Leaf {
    v1: Int;
    v2: String;
    v3: Bool;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

contract OptionalNested {
    root: Branch;

    init() {
        self.root = Branch{
            left: null,
            right: Leaf{
                v1: 10,
                v2: "hello",
                v3: true
            }
        };
    }
}