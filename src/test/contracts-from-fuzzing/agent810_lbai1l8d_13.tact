struct NestedOptFields {
    foo: Int?;
    bar: Bool?;
}

contract OptStructOptFields {
    st: NestedOptFields?;
    init() {
        self.st = null;
    }
}
