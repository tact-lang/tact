contract PrimitiveMix {
    count: Int;
    flag: Bool;
    addr: Address;
    blob: Cell;
    text: String;
    data: Slice;

    init() {
        self.count = 5;
        self.flag = true;
        self.addr = myAddress();
        self.blob = emptyCell();
        self.text = "test";
        self.data = emptyCell().asSlice();
    }
}