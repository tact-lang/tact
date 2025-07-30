contract MixedTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addressVal: Address;
    optInt: Int?;
    optString: String?;
    optBool: Bool?;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.stringVal = "test";
        self.addressVal = myAddress();
        self.optInt = null;
        self.optString = null;
        self.optBool = null;
    }
}