struct Opts {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

contract OptsInField {
    o: Opts;

    init() {
        self.o = Opts{ a:null, b:null, c:null, d:null };
    }
}