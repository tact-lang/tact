struct InnerOpt {
    a: Int?;
}

struct OuterOpt {
    inner: InnerOpt;
}

contract Test {
    d: OuterOpt;
    init() {
        self.d = OuterOpt{ inner: InnerOpt{ a: null } };
    }
}