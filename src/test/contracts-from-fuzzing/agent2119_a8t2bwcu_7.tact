contract MixedTypes {
    idx: Int;
    enabled: Bool;
    owner: Address;
    note: String;
    sliceVal: Slice;
    cellVal: Cell;

    init() {
        self.idx = 100;
        self.enabled = true;
        self.owner = myAddress();
        self.note = "done";
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
    }
}
