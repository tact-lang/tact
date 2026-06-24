struct Opts {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OmitDefaults {
    f: Opts;

    init() {
        self.f = Opts{};  // omit all
    }
}