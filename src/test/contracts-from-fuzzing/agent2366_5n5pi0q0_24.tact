struct OptInner {
    foo: Int?;
}

contract NullOptInner {
    field1: OptInner?;
    field2: OptInner?;
    field3: OptInner?;

    init() {
        self.field1 = null;
        self.field2 = null;
        self.field3 = null;
    }
}