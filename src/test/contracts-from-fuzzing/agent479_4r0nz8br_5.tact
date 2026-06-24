struct Opts {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    qux: Address?;
}

contract Test {
    opts: Opts;

    init() {
        self.opts = Opts{
            foo: 42,
            bar: true,
            baz: "hi",
            qux: myAddress()
        };
    }
}