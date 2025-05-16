struct NestedStrOpt {
    foo: String?;
    bar: Bool;
}

contract OptionalStringInNested {
    nested: NestedStrOpt;

    init() {
        self.nested = NestedStrOpt{
            foo: null,
            bar: true
        };
    }
}