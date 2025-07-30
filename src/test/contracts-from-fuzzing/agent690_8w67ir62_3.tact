struct HasOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalContract {
    data: HasOptional;

    init() {
        self.data = HasOptional{
            foo: null,
            bar: true,
            baz: null,
        };
    }
}