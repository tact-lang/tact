struct Sub {
    foo: Int?;
}

contract Test {
    nested: Sub?;

    init() {
        self.nested = null;
    }
}