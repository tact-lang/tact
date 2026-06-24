struct Opts {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract Test {
    f: Opts;

    init() {
        self.f = Opts{ s:null, i:null, b:null };
    }
}