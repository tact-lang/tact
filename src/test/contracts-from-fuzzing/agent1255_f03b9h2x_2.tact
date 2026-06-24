struct NestedOpt {
    foo: Int?;
    bar: Bool?;
}

contract Test2 {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            foo: null,
            bar: null,
        };
    }
}