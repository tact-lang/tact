contract MixedFields {
    intVal: Int;
    strVal: String;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;

    init() {
        self.intVal = 42;
        self.strVal = "hello";
        self.boolOpt = null;
        self.addrOpt = null;
        self.cellOpt = null;
    }
}