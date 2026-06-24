struct InnerOpt {
    x: Int?;
}

contract ExplicitNullField {
    s: InnerOpt;

    init() {
        self.s = InnerOpt{ x: null };
    }
}