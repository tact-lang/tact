struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract C {
    f: Opts;

    init() {
        self.f = Opts{
            a: null,
            b: null,
            c: null,
        };
    }
}