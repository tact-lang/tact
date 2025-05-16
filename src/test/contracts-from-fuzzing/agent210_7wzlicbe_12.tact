contract MixedPrimitives {
    intVal: Int = 0;
    boolVal: Bool = true;
    strVal: String = "hi";
    addrVal: Address;

    init() {
        self.intVal = 42;
        self.boolVal = false;
        self.strVal = "hello";
        self.addrVal = myAddress();
    }
}