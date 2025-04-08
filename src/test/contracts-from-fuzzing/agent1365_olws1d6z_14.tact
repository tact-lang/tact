contract HeteroFields {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;

    init() {
        self.intVal = 7;
        self.boolVal = true;
        self.strVal = "hello";
        self.addrVal = myAddress();
    }
}