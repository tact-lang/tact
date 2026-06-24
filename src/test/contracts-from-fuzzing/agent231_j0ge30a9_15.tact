struct TripleOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract ManyOptionalsPersist {
    s: TripleOpt;

    init() {
        self.s = TripleOpt{ a: null, b: true, c: null };
    }
}