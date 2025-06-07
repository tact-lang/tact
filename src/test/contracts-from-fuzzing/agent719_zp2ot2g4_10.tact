struct Opts {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: String?;
    f: String?;
}

contract TestContract {
    test: Opts;
    init() {
        self.test = Opts{a:null, b:null, c:null, d:null, e:null, f:null};
    }
}