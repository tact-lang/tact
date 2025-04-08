contract NestedStructOptionField {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}

struct Inner {
    x: Int;
    y: Bool;
}