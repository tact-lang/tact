contract MultiTypeFields {
    x: Int;
    flag: Bool;
    info: String;
    data: Cell;
    sliceData: Slice;
    addressField: Address;

    init() {
        self.x = 42;
        self.flag = true;
        self.info = "Hello";
        self.data = emptyCell();
        self.sliceData = emptyCell().asSlice();
        self.addressField = myAddress();
    }
}