struct NestedOpt {
    n1: Int;
    n2: String?;
}

struct Root {
    x: NestedOpt?;
    y: Bool;
}

contract MainOpt {
    s: Root;

    init() {
        self.s = Root{
            x: NestedOpt{
                n1: 5,
                n2: null,
            },
            y: true,
        };
    }
}