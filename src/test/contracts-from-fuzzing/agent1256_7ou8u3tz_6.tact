struct Inner {
    flag: Bool?;
    count: Int?;
}

contract OptionalNested {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}