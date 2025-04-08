struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    o: Opts;

    init() {
        self.o = Opts{ a: null, b: true, c: "x", d: null, e: false, f: null };
    }
}