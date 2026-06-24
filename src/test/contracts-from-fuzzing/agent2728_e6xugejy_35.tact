struct BothOptional {
    s: String?;
    b: Bool?;
}

contract Test {
    foo: BothOptional?;

    init() {
        self.foo = null;
    }
}
