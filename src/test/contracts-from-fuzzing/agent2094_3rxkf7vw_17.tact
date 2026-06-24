struct Chain {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int?;
}

contract InlineMix {
    ch: Chain = Chain{
        a: 5,
        b: null,
        c: "hi",
        d: null,
        e: 10
    };
    receive() {}
}
