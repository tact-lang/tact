struct NestedOpt {
    flag: Bool?;
    val: Int?;
    s: String;
}

contract OptionalFields {
    a: Int?;
    s: String?;
    b: Bool?;
    obj: NestedOpt?;

    init() {
        self.a = null;
        self.s = null;
        self.b = null;
        self.obj = null;
    }
}