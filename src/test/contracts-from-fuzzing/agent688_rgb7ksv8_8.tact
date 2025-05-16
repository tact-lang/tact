struct Opts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract AllOptionals {
    opts: Opts;

    init() {
        self.opts = Opts{};
    }
}
