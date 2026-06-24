struct NestedOptional {
    s: InnerOption?;
}

struct InnerOption {
    x: Int?;
    y: Bool?;
}

contract Test {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            s: InnerOption{
                x: null,
                y: null,
            },
        };
    }
}