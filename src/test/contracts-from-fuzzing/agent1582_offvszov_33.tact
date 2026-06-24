struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract StructOptDefaults {
    s: SOpt = SOpt{
        a: null,
        b: null,
        c: null,
    };

    receive() {}
}