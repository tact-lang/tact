struct NestedOpt {
    val: Int?;
    label: String;
}

struct Container {
    nested: NestedOpt?;
    id: Int;
}

contract OptStructField {
    data: Container;

    init() {
        self.data = Container{
            nested: NestedOpt{
                val: null,
                label: "test",
            },
            id: 999,
        };
    }
}