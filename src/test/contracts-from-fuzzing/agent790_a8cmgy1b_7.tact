contract LongContractWithVariousFields {
    value1: Int;
    value2: Int?;
    flag: Bool;
    text: String;
    data: Cell;
    sliceVal: Slice;
    builder: Builder;
    addressVal: Address;

    init() {
        self.value1 = 1;
        self.value2 = null;
        self.flag = true;
        self.text = "test";
        self.data = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builder = beginCell();
        self.addressVal = myAddress();
    }
}
