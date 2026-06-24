struct Opts {
    a: Int?; b: Bool?; c: Address?;
}

contract OptionalFields {
    foo: Opts;

    init() {
        self.foo = Opts{
            a: null,
            b: null,
            c: null,
        };
    }
}