struct InnerOptional {
    foo: Int?;
    bar: Bool?;
    text: String?;
}

contract OptionalTest {
    nested: InnerOptional;

    init() {
        self.nested = InnerOptional{
            foo: null,
            bar: true,
            text: null
        };
    }
}