contract AllTypes {
    v1: Int = 1;
    v2: Bool = true;
    v3: String = "s";
    v4: Address;
    v5: Cell;
    v6: Slice;

    init() {
        self.v4 = myAddress();
        self.v5 = beginCell().endCell();
        self.v6 = self.v5.asSlice();
    }
}