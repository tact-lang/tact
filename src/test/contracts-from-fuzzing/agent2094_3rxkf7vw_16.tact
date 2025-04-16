struct Chain {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int?;
}

contract InlineOpts {
    ch: Chain = Chain{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null
    };
    receive() {}
}
