contract MultiplePrimitives {
    flag: Bool;
    num: Int;
    text: String;
    addr: Address;
    data: Cell;
    builderObj: Builder;
    sliceObj: Slice;

    init() {
        self.flag = false;
        self.num = 0;
        self.text = "";
        self.addr = myAddress();
        self.data = emptyCell();
        self.builderObj = beginCell();
        self.sliceObj = emptyCell().asSlice();
    }
}