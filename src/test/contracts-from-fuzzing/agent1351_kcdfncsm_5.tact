struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFields {
    opts: Opts;

    init() {
        self.opts = Opts{
            a: null,
            b: null,
            c: null
        };
    }
}