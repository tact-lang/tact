struct ComplexMix {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
    g: Address?;
    h: Int?;
    i: Bool;
    j: String?;
}

contract LargeStructPersist2 {
    big: ComplexMix = ComplexMix{
        a: 1,
        b: null,
        c: "X",
        d: null,
        e: true,
        f: null,
        g: null,
        h: null,
        i: false,
        j: null,
    };
}