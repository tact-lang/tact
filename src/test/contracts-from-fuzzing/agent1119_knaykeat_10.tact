struct Opts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Slice?;
}

contract OptionalInsideStructs {
    s1: Opts;
    s2: Opts;

    init() {
        self.s1 = Opts{ a:null, b:null, c:null, d:null, e:null };
        self.s2 = Opts{ a:null, b:null, c:null, d:null, e:null };
    }
}