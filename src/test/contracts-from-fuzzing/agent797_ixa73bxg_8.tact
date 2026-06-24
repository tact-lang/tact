struct BigStructOpt {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
}

contract TestBigStructOpt {
    data: BigStructOpt = BigStructOpt{
        i: null,
        b: null,
        s: null,
        a: null,
        c: null,
        sl: null
    };

    init() {}
}