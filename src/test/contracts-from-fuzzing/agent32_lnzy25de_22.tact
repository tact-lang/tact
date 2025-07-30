struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    opts: Opts;

    init() {
        self.opts = Opts{};
    }
}