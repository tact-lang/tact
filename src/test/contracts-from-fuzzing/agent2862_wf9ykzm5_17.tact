struct LargeOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract OptionalMix {
    o: LargeOptional = LargeOptional{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null,
        f: null,
    };
}