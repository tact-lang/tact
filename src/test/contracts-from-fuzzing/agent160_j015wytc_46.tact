struct NestedMultiOpt {
    inner1: InnerOpt?;
    inner2: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
    txt: String?;
}

contract DeepMultiOpt {
    f: NestedMultiOpt;
    init() {
        self.f = NestedMultiOpt{
            inner1: InnerOpt{val:null, txt:null},
            inner2: null
        };
    }
}