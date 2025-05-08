struct NestedOpt {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract OptionalStructs {
    a: NestedOpt?;
    b: NestedOpt?;
    c: NestedOpt?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
