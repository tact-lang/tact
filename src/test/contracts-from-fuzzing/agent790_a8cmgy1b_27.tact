struct TripleNested {
    s: String?;
}

struct DoubleNested {
    tn: TripleNested?;
}

struct SingleNested {
    dn: DoubleNested?;
}

contract OptionalDeepNest {
    sn: SingleNested?;

    init() {
        self.sn = null;
    }
}
