contract MultiOptional {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address?;

    init() {
        self.intVal = 123;
        self.boolVal = false;
        self.addrVal = null;
    }
}