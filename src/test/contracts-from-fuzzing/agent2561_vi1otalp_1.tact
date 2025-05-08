struct Inner {
    a: Int;
    b: Bool?;
}

contract DeepOptionalNested {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}