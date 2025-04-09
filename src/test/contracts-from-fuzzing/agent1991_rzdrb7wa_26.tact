contract OptionalContractBasics {
    foo: Int?;
    bar: Bool?;

    init() {
        self.foo = 1;
        self.bar = null;
    }
}