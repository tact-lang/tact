struct HasOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestOpt {
    foo: HasOptional;

    init() {
        self.foo = HasOptional{
            a: null,
            b: true,
            c: "hello"
        };
    }
}