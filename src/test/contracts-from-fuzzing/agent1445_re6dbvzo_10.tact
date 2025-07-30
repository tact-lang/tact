contract OptionalFields {
    strVal: String?;
    addrVal: Address?;
    boolVal: Bool?;
    intVal: Int?;

    init() {
        self.strVal = "hello";
        self.addrVal = myAddress();
        self.boolVal = true;
        self.intVal = 777;
    }
}