struct OptionalLayer {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract UseOptionalLayer {
    st: OptionalLayer;

    init() {
        self.st = OptionalLayer{
            foo: 123,
            bar: null,
            baz: "hello",
        };
    }
}