struct InnerOpt {
    n: Int?;
}

struct MidOpt {
    inner: InnerOpt?;
}

contract ComplexOptStruct {
    val: MidOpt;
    init() {
        self.val = MidOpt{inner: null};
    }
}
