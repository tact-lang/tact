contract TestContract {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    addressVal: Address;
    intOptVal: Int?;
    boolOptVal: Bool?;
    stringOptVal: String?;
    addressOptVal: Address?;

    init() {
        self.intVal = 1;
        self.boolVal = false;
        self.stringVal = "hi";
        self.addressVal = myAddress();
        self.intOptVal = null;
        self.boolOptVal = true;
        self.stringOptVal = null;
        self.addressOptVal = null;
    }
}