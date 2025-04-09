struct ComboOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFields {
    f1: ComboOpt = ComboOpt{ a: null, b: null, c: null };
    f2: ComboOpt = ComboOpt{ a: 1, b: true, c: "x" };

    init() {
        self.f1 = ComboOpt{ a: 42, b: false, c: "abc" };
        self.f2 = ComboOpt{ a: null, b: null, c: null };
    }
}