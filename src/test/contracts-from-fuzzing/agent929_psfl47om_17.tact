contract OnlyDefaults {
    intVal: Int = 0;
    boolVal: Bool = false;
    addrVal: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    strVal: String = "";

    init() {
        self.intVal = 100;
        self.boolVal = true;
        self.addrVal = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.strVal = "abc";
    }
}