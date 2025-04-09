struct NestedOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

struct Container {
    nested: NestedOptionals;
    regular: Int;
}

contract NestedOptionIssue {
    data: Container;

    init() {
        self.data = Container{
            nested: NestedOptionals{
                opt1: null,
                opt2: null,
                opt3: null
            },
            regular: 5
        };
    }
}