struct SSub {
    n: Int;
}

struct SNested {
    sub: SSub;
}

contract InitOrder {
    nested: SNested = SNested{sub: SSub{n: 0}};
    init() {}
}