struct TripleOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Test {
    to: TripleOptional = TripleOptional{
        a: null,
        b: null,
        c: null,
    };

    init() {}
}