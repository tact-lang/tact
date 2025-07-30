struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract MixOpt {
    f: Opts;

    init() {
        self.f = Opts{
            a: null,
            b: false,
            c: "hello"
        };
    }
}
