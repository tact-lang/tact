struct Opts {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
}

contract OptFields {
    big: Opts;

    init() {
        self.big = Opts{ a:null, b:null, c:null, d:null };
    }
}