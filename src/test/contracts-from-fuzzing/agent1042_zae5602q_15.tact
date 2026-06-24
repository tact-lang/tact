struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct ContainsOpt {
    c: Cell?;
    d: String?;
    inner: InnerOpt;
}

contract OptInNested {
    f: ContainsOpt = ContainsOpt{c:null, d:null, inner: InnerOpt{a:null,b:null}};
}