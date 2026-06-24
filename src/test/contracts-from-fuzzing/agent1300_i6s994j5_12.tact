struct Opts {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptFields {
    opts: Opts = Opts{ foo: null, bar: null, baz: null };
}