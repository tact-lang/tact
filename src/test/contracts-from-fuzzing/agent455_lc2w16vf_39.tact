struct NestedStrOpt {
    foo: Bar?;
}

struct Bar {
    baz: String?;
}

contract NullOptStr {
    bar: NestedStrOpt;

    init() {
        self.bar = NestedStrOpt{
            foo: Bar{ baz: null },
        };
    }
}