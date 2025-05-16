struct InnerOptional {
    foo: Int?;
    bar: Bool?;
}

contract OptionalNested {
    data: InnerOptional;

    init() {
        self.data = InnerOptional{ foo: null, bar: null };
    }
}