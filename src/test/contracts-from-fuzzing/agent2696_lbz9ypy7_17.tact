struct InnerStr {
    val: String;
    flag: Bool;
}

struct OuterOpt {
    inner: InnerStr?;
}

contract ContractOpt {
    f: OuterOpt;
    init() {
        self.f = OuterOpt{ inner: null };
    }
}