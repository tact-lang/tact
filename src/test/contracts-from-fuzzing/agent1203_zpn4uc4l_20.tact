struct MoreOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract OptionalCombo {
    stuff: MoreOptionals;
    init() {
        self.stuff = MoreOptionals{a:null, b:null, c:null, d:null, e:null, f:null};
    }
}