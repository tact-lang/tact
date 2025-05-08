struct Opts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract PersistentOpts {
    foo: Opts;

    init() {
        self.foo = Opts{ a:null, b:null, c:null };
    }
}