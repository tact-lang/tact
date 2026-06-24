struct Inner {
    a: Int;
    b: Bool?;
}

contract TestDeepOptionalNested {
    nestedField: Inner?;

    init() {
        self.nestedField = null;
    }
}