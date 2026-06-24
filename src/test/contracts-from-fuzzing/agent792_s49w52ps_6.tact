contract TestContract {
    intField: Int;
    boolField: Bool;
    cellField: Cell;
    addressField: Address;
    stringField: String;
    optInt: Int?;
    optBool: Bool?;
    optCell: Cell?;
    optAddress: Address?;
    optString: String?;

    init() {
        self.intField = 123;
        self.boolField = true;
        self.cellField = emptyCell();
        self.addressField = myAddress();
        self.stringField = "hello";
        self.optInt = null;
        self.optBool = null;
        self.optCell = null;
        self.optAddress = null;
        self.optString = null;
    }
}