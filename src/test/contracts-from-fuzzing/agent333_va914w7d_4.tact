struct HasOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalStructField {
    inner: HasOptional;

    init() {
        self.inner = HasOptional{foo: null, bar: true, baz: null};
    }
}