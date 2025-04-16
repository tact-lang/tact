struct HasOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptsTest {
    data: HasOptional;

    init() {
        self.data = HasOptional{
            foo: null,
            bar: true,
            baz: "hello",
        };
    }
}
