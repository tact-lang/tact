struct InnerS {
    a: Int = 5;
    b: Bool = true;
}

struct WrapperS {
    inner: InnerS;
}

contract DefaultsDeep {
    w: WrapperS;
    init() {
        self.w = WrapperS{ inner: InnerS{} };
    }
}