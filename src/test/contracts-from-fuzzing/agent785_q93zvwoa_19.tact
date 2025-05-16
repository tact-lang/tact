struct Sub {
    flag: Bool;
    note: String;
}

contract Combo {
    intField: Int?;
    boolField: Bool;
    strField: String;
    subStruct: Sub?;

    init() {
        self.intField = null;
        self.boolField = false;
        self.strField = "abc";
        self.subStruct = null;
    }
}