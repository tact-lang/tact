struct InnerPrim {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
}

struct OuterOpt {
    p: InnerPrim?;
    num: Int?;
    flag: Bool?;
    addr: Address?;
    str: String?;
}

contract BothExtremes {
    store: OuterOpt;

    init() {
        self.store = OuterOpt{
            p: null,
            num: null,
            flag: null,
            addr: null,
            str: null
        };
    }
}
