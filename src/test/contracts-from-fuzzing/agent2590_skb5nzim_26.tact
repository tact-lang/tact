struct StringOptional {
    a: String?;
}

contract StringOptContract {
    foo: StringOptional;
    init() {
        self.foo = StringOptional{ a: null };
    }
}