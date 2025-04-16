struct OptionalNested {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFields {
    nestedOpt: OptionalNested;
    num: Int?;
    flag: Bool?;
    txt: String?;

    init() {
        self.nestedOpt = OptionalNested{ a: null, b: null, c: null };
        self.num = null;
        self.flag = null;
        self.txt = null;
    }
}