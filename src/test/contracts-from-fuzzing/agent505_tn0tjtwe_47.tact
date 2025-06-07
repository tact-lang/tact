struct InnerOptFields {
    x: Int?;
    y: Bool?;
}

contract OptionalStructWhole {
    foo: InnerOptFields?;

    init() {
        self.foo = null;
    }
}
