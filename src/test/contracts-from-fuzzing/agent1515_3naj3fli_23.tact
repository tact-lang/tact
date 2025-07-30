contract PrimitivesAllTogether {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    stringVal: String;

    init() {
        self.intVal = 999;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.stringVal = "test";
    }
}