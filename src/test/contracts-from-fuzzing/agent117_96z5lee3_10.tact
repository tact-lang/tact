struct Variant {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
}

contract ManyOptionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    s: Variant;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.s = Variant{intOpt:null, boolOpt:null, strOpt:null};
    }
}