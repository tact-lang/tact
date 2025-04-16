struct FlatOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
}

contract FlatOptContract {
    data: FlatOpt = FlatOpt{
        a: null,
        b: true,
        c: null,
        d: null,
        e: null,
    };
}