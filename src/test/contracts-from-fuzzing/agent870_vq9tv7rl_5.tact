struct OptionNested {
    nestedOpt: NestedOpt?;
}

struct NestedOpt {
    foo: Int?;
    bar: Bool?;
}

contract Test {
    data: OptionNested = OptionNested{
        nestedOpt: null
    };

    init() {
        self.data = OptionNested{
            nestedOpt: NestedOpt{
                foo: 42,
                bar: true
            }
        };
    }
}
