struct TripleOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WrapTripleOpt {
    inner: TripleOpt;
    flag: Bool;
}

contract TestContract {
    nestedOpt: WrapTripleOpt = WrapTripleOpt{
        inner: TripleOpt{ a:null, b:null, c:null },
        flag: false
    };
}