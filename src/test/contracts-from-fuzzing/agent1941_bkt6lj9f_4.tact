struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
}

contract TestContract {
    opts: Opts;

    init() {
        self.opts = Opts{ a:null, b:true, c:null, d:123, e:null };
    }
}