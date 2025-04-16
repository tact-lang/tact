struct EmptyOptional {
    a: Int?;
}

struct NestedEmptyOpt {
    inner: EmptyOptional;
}

contract TestContract {
    nestedField: NestedEmptyOpt;

    init() {
        self.nestedField = NestedEmptyOpt{
            inner: EmptyOptional{ a: null }
        };
    }
}