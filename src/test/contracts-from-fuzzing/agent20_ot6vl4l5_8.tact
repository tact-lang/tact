struct HasOptional {
    val: Int?;
}

contract OptionalReplace {
    foo: HasOptional;

    init() {
        self.foo = HasOptional{ val: 10 };
        self.foo = HasOptional{ val: null };
    }
}