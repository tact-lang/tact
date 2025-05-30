struct NestedOpt {
    value: Int?;
    label: String;
}

struct Container {
    nested1: NestedOpt;
    nested2: NestedOpt?;
}

contract Test {
    c: Container;

    init() {
        self.c = Container{
            nested1: NestedOpt{
                value: 5,
                label: "n1"
            },
            nested2: null
        };
    }
}
