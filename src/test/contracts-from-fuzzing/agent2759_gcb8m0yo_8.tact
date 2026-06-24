contract PrimitiveFields {
    fieldInt: Int;
    fieldBool: Bool;
    fieldAddress: Address;
    fieldCell: Cell;
    fieldSlice: Slice;
    fieldString: String;

    init() {
        self.fieldInt = 1;
        self.fieldBool = true;
        self.fieldAddress = myAddress();
        self.fieldCell = emptyCell();
        self.fieldSlice = emptyCell().asSlice();
        self.fieldString = "hello";
    }
}