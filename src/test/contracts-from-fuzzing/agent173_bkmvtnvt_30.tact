struct AllOpt {
    b: Bool?;
    i: Int?;
    c: Cell?;
    s: Slice?;
    a: Address?;
    t: String?;
}

contract AllOptPersist {
    data: AllOpt = AllOpt{
        b: true,
        i: 1,
        c: null,
        s: null,
        a: null,
        t: "abc",
    };
}