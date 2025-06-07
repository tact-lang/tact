struct InnerStr {
    str: String;
}

struct MidStr {
    inner: InnerStr;
}

struct TopStr {
    mid: MidStr;
}

contract PersistStringNest {
    pf: TopStr;

    init() {
        self.pf = TopStr { mid: MidStr { inner: InnerStr { str: "abc" } } };
    }
}
