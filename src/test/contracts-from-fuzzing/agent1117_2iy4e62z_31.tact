struct OptInner {
    num: Int;
    txt: String?;
}

contract ContainsInnerOpt {
    field: OptInner;

    init() {
        self.field = OptInner{ num:2, txt:null };
    }
}
