contract NullableFields {
    foo: Int?;
    bar: String?;
    baz: Bool?;
    q1: Address?;
    q2: Cell?;
    q3: Slice?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.q1 = null;
        self.q2 = null;
        self.q3 = null;
    }
}