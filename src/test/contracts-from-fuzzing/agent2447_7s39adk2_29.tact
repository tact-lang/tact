struct AllMix {
    v: Int;
    f: Bool;
    txt: String;
    addr: Address;
    op1: Int?;
    op2: Bool?;
    op3: String?;
    op4: Address?;
}

contract BigInit {
    s: AllMix = AllMix{
        v:1,
        f:true,
        txt:"abc",
        addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        op1:null,
        op2:null,
        op3:null,
        op4:null
    };
}