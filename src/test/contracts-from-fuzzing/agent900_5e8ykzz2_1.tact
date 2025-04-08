contract TestContract {
    value: Int;
    flag: Bool;
    text: String;
    addressField: Address;
    dataCell: Cell;
    builder: Builder;
    slice: Slice;
    optionalInt: Int?;
    optionalBool: Bool?;
    nestedOptString: String?;

    init() {
        self.value = 1;
        self.flag = true;
        self.text = "test";
        self.addressField = myAddress();
        self.dataCell = emptyCell();
        self.builder = beginCell();
        self.slice = emptyCell().asSlice();
        self.optionalInt = null;
        self.optionalBool = false;
        self.nestedOptString = null;
    }
}