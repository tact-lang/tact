struct Opts {
    a: Int?;
    b: String?;
    c: Address?;
    d: Cell?;
}

contract OptionalMix {
    opt: Opts;
    init() {
        self.opt = Opts{ a:null, b:null, c:null, d:null };
    }
}