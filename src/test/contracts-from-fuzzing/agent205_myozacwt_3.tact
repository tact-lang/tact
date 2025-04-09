struct Opts {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalHolder {
    opts: Opts;

    init() {
        self.opts = Opts{
            foo: null,
            bar: true,
            baz: null,
        };
    }
}