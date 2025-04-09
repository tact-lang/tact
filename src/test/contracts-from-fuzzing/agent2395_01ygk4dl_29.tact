struct MixedOpt {
    a: Int?;
    s: String?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
}

contract MixedOptionals {
    f: MixedOpt;

    init() {
        self.f = MixedOpt{ a:null, s:null, b:null, c:null, d:null };
    }
}
