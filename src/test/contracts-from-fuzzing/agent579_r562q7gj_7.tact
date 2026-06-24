struct NestedOpt {
    num: Int;
}

struct Container {
    optNested: NestedOpt?;
    label: String;
}

contract StructInStructOpt {
    field: Container;

    init() {
        self.field = Container{
            optNested: null,
            label: "test"
        };
    }
}