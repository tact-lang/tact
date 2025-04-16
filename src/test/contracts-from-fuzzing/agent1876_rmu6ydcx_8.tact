contract OnlyOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    owner: Address?;
    data: Cell?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.owner = null;
        self.data = null;
    }
}