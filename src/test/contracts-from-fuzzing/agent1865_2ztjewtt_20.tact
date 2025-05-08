contract ManyPersistentTypes {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    optBool: Bool?;
    stringVal: String;
    optString: String?;
    addrVal: Address;
    optAddr: Address?;

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.optInt = null;
        self.optBool = null;
        self.stringVal = "hi";
        self.optString = null;
        self.addrVal = myAddress();
        self.optAddr = null;
    }
}