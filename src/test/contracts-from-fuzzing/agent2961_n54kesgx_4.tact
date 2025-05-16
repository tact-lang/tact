struct OptInner {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalNested {
    innerOpt: OptInner;

    init() {
        self.innerOpt = OptInner{ a: null, b: null, s: null };
    }
}