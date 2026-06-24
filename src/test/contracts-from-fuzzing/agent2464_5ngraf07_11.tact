contract ManyPrimitives {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;

    init() {
        self.intVal = 7;
        self.boolVal = false;
        self.strVal = "seven";
        self.addrVal = myAddress();
        self.optInt = null;
        self.optBool = true;
        self.optStr = null;
        self.optAddr = myAddress();
    }
}
