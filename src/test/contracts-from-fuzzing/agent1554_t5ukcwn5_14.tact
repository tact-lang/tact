contract ManyFieldsKinds {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;

    init() {
        self.intVal = 10;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.strVal = "abc";
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optStr = null;
    }
}