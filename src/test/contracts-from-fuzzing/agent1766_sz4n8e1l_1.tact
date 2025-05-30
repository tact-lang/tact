struct NestedOpt {
    foo: Int?;
    bar: Bool?;
}

contract DeepContract {
    nested: NestedOpt;

    init() {
        self.nested = NestedOpt{
            foo: null,
            bar: true,
        };
    }
}