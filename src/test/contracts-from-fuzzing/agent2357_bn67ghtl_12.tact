struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract ContractWithDefaults {
    s: SOpt = SOpt{
        a: null,
        b: null,
        c: null,
        d: null
    };

    init() {
        self.s = SOpt{ a:null, b:null, c:null, d:null };
    }
}
