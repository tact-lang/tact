contract MultiTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.strVal = "Hello";
        self.optInt = null;
        self.optBool = false;
    }
}