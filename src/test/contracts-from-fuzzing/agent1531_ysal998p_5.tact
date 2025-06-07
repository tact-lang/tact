struct HasOptional {
    foo: Int?;
    bar: String?;
}

contract OptStorage {
    s: HasOptional;

    init() {
        self.s = HasOptional{
            foo: null,
            bar: "hello",
        };
    }
}
