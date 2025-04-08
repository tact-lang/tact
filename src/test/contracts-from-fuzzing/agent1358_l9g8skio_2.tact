struct NestedOpt {
    foo: Int?;
    bar: Bool;
}

contract Test {
    data: NestedOpt;

    init() {
        self.data = NestedOpt {
            foo: 10,
            bar: true,
        };
    }
}