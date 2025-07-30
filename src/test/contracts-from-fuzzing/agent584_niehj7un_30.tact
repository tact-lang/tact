struct InnerOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructDefaults {
    s: InnerOpt = InnerOpt{ a: null, b: null, c: null };

    init() {
        self.s = InnerOpt{ a: 42, b: true, c: "str" };
    }
}