struct Opts {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract TestOptionalFields {
    opts: Opts;
    init() {
        self.opts = Opts{
            i: null,
            b: true,
            s: null
        };
    }
}
