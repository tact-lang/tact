struct InnerDeepOptional {
    foo: Int?;
}

struct Mid {
    bar: InnerDeepOptional?;
}

struct TopLevel {
    baz: Mid?;
}

contract NestedOptionalFieldsTest {
    store: TopLevel;

    init() {
        self.store = TopLevel{
            baz: null
        };
    }
}