struct NestedOpt {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract TestStorage {
    nested: NestedOpt;
    init() {
        self.nested = NestedOpt{
            foo: 1,
            bar: true,
            baz: "hi"
        };
    }
}