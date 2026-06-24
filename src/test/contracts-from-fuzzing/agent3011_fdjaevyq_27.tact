struct Agg {
    a: Int?;
    b: Int;
    c: Bool?;
    d: String;
    e: Address?;
}

contract OptionalMixComplex {
    foo: Agg;
    init() {
        self.foo = Agg{ a:null, b:2, c:null, d:"hi", e:null };
    }
}