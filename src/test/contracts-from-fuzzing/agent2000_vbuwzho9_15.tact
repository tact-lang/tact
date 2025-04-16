struct NestedDefaultOpt {
    s: String? = null;
    b: Bool? = null;
}

struct OuterWrap {
    inner: NestedDefaultOpt? = null;
    flag: Bool = false;
}

contract DefaultOptionStructs {
    st: OuterWrap;

    init() {
        self.st = OuterWrap{};
    }
}