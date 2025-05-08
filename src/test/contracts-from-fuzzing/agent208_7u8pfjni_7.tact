struct InnerNestedOpt {
    foo: Int?;
    bar: Bool;
}

struct Wrap {
    nestedOpt: InnerNestedOpt?;
    value: Int;
}

contract Test8 {
    data: Wrap;

    init() {
        self.data = Wrap{
            nestedOpt: InnerNestedOpt{foo: null, bar: true},
            value: 42,
        };
    }
}