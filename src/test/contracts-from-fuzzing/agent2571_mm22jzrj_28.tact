struct Deeply {
    level: Int;
    info: String;
    ok: Bool?;
}

contract MixedFields {
    d1: Deeply;
    intField: Int?;
    strField: String;
    boolField: Bool;

    init() {
        self.d1 = Deeply{level:1,info:"a",ok:null};
        self.intField = null;
        self.strField = "b";
        self.boolField = true;
    }
}
