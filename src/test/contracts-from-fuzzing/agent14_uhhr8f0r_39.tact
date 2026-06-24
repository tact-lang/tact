struct EmbedOptional {
    bar: Int?;
}

contract Test {
    foo: EmbedOptional;

    init() {
        self.foo = EmbedOptional { bar: null };
    }
}