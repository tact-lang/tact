// contract with primitive optionals
contract TestContract {
    foo: Int?;
    bar: String?;
    baz: Bool?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
    }
}