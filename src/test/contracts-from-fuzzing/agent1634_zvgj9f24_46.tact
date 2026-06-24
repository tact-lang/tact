struct OptionalsMix {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract OptMixContract {
    m: OptionalsMix;

    init() {
        self.m = OptionalsMix{ a:null, b:null, c:null, d:null, e:null, f:null };
    }
}