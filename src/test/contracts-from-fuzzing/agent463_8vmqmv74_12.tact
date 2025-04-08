contract MixedVars {
    intVal: Int = 0;
    boolVal: Bool = false;
    optionalVal: Int? = null;
    addrVal: Address;
    strVal: String = "";

    init() {
        self.intVal = 5;
        self.addrVal = myAddress();
    }
}