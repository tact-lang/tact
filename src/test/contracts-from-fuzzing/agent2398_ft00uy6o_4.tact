contract ComboTypes {
    intVal: Int;
    boolVal: Bool;
    optIntVal: Int?;
    strVal: String;
    optStrVal: String?;
    addrVal: Address;
    optAddrVal: Address?;

    init() {
        self.intVal = 7;
        self.boolVal = false;
        self.optIntVal = null;
        self.strVal = "abc";
        self.optStrVal = null;
        self.addrVal = myAddress();
        self.optAddrVal = null;
    }
}