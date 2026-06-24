struct NestedOpt {
    val: Int?;
}

struct WithNestedOpt {
    foo: NestedOpt?;
    bar: String;
}

contract BetweenNested {
    data: WithNestedOpt;

    init() {
        self.data = WithNestedOpt{
            foo: null,
            bar: "value"
        };
    }
}