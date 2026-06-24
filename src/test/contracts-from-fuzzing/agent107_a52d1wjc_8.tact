contract TenVars {
    v1: Int;
    v2: Bool;
    v3: Cell;
    v4: String;
    v5: Slice;
    v6: Address;
    v7: Int?;
    v8: Bool?;
    v9: String?;
    v10: Cell?;

    init() {
        self.v1 = 1;
        self.v2 = true;
        self.v3 = emptyCell();
        self.v4 = "Sample";
        self.v5 = emptyCell().asSlice();
        self.v6 = myAddress();
        self.v7 = null;
        self.v8 = null;
        self.v9 = null;
        self.v10 = null;
    }
}