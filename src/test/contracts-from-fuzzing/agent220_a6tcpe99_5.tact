struct Opts {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract ManyOpts {
    opts: Opts;

    init() {
        self.opts = Opts{};
    }

    receive() {}
}