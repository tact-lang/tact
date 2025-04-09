contract ManyPrimitiveFields {
    flag: Bool;
    amount: Int;
    owner: Address;
    info: String;
    codeRef: Cell;
    sliceData: Slice;
    builderObj: Builder;

    init() {
        self.flag = false;
        self.amount = 100;
        self.owner = myAddress();
        self.info = "Test";
        self.codeRef = myCode();
        self.sliceData = self.codeRef.asSlice();
        self.builderObj = beginCell();
    }
}