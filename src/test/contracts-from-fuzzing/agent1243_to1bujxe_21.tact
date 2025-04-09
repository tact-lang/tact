struct NestedOptional {
    value: Int?;
}

struct Container {
    nested: NestedOptional?;
}

contract Test {
    foo: Container?;
    init() {
        self.foo = null;
    }
}