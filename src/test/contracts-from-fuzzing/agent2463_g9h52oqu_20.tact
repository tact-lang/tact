struct SOptional {
    i: Int?;
    s: String?;
    b: Bool?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
}

contract ComplexOptional {
    state: SOptional = SOptional{
        i: null,
        s: null,
        b: null,
        a: null,
        c: null,
        sl: null
    };

    init() {}
}
