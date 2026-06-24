struct S {
    foo: Int?;
}

contract Test {
    field: S?;

    init() {
        self.field = null;
    }
}
