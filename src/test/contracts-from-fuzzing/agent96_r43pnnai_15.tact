contract MixedOptionPersistence {
    intVal: Int;
    optInt: Int?;
    boolVal: Bool;
    optBool: Bool?;
    addrVal: Address;
    optAddr: Address?;

    init() {
        self.intVal = 1;
        self.optInt = null;
        self.boolVal = true;
        self.optBool = null;
        self.addrVal = myAddress();
        self.optAddr = null;
    }
}