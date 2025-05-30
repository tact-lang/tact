struct Inner {
    val: Int?;
}

contract NullNested {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}