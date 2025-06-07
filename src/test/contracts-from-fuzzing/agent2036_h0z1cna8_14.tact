struct Opts {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract Test {
    f1: Opts;
    f2: Opts?;

    init() {
        self.f1 = Opts{ a:null,b:null,c:null };
        self.f2 = null;
    }
}