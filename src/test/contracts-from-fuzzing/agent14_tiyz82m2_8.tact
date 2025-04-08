contract ManyTypes {
    intField: Int;
    boolField: Bool;
    strField: String;
    opInt: Int?;
    opBool: Bool?;
    opStr: String?;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.strField = "hi";
        self.opInt = 10;
        self.opBool = null;
        self.opStr = "bye";
    }
}