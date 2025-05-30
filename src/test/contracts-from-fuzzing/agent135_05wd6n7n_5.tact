contract ManyTypes {
    intVal: Int = 1;
    boolVal: Bool = true;
    optInt: Int? = null;
    strVal: String = "hello";
    // leave cell fields uninitialized, set in init
    cellVal: Cell;
    addressVal: Address;

    init() {
        self.intVal = 2;
        self.boolVal = false;
        self.optInt = 3;
        self.strVal = "world";
        self.cellVal = emptyCell();
        self.addressVal = myAddress();
    }
}
