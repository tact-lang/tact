contract MultiFields {
    x: Int;
    y: Bool;
    text: String;
    blob: Cell;
    sliceData: Slice;
    builderData: Builder;
    addr: Address;

    init() {
        self.x = 1;
        self.y = false;
        self.text = "hi";
        self.blob = emptyCell();
        self.sliceData = emptyCell().asSlice();
        self.builderData = beginCell();
        self.addr = myAddress();
    }
}