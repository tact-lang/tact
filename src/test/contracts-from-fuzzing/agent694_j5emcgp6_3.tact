struct HasOptional {
    foo: Int;
    bar: Bool?;
    baz: String?;
}

contract TestContract {
    data: HasOptional;

    init() {
        self.data = HasOptional{
            foo: 42,
            bar: null,
            baz: null
        };
    }
}