struct Inner {
    s: String;
    b: Bool;
}

contract NestedStructOptional {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}