struct TripleNested {
    x: Int = 1;
    y: Int = 2;
}

struct DoubleNested {
    tn: TripleNested;
}

struct SingleNested {
    dn: DoubleNested;
}

contract TestContract {
    sn: SingleNested = SingleNested{ dn: DoubleNested{ tn: TripleNested{} } };
    k: Int = 3;
}