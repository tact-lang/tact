contract MixedPrimitives {
    intVal: Int = 42;
    boolVal: Bool = false;
    optInt: Int?;
    optBool: Bool?;
    strVal: String = "test";
    optStr: String?;
    addrVal: Address;
    optAddr: Address?;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.optStr = null;
        self.addrVal = myAddress();
        self.optAddr = null;
    }
}