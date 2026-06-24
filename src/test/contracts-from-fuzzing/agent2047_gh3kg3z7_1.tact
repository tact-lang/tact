struct Inner {
    a: Int;
    b: Bool;
}

contract DeepNestedOptional {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}