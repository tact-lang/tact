contract TestContract {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;

    init() {
        self.intVal = 123;
        self.boolVal = true;
        self.addrVal = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.strVal = "hello";
    }
}