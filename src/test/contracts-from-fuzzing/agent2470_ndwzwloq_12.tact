struct OptionalNesting {
    s: String?;
    i: Int?;
    b: Bool?;
    addr: Address?;
    c: Cell?;
    sl: Slice?;
}

contract OptNest {
    data: OptionalNesting = OptionalNesting{
        s: null,
        i: null,
        b: null,
        addr: null,
        c: null,
        sl: null,
    };
}