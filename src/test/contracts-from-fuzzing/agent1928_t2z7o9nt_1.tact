contract TestContract {
    v1: Int;
    v2: Bool;
    v3: Address;
    v4: Cell;
    v5: Slice;
    v6: String;
    v7: Int?;
    v8: Bool?;
    v9: Address?;
    v10: Cell?;
    v11: Slice?;
    v12: String?;

    init() {
        self.v1 = 1;
        self.v2 = true;
        self.v3 = myAddress();
        self.v4 = emptyCell();
        self.v5 = emptyCell().asSlice();
        self.v6 = "hello";
        self.v7 = null;
        self.v8 = null;
        self.v9 = null;
        self.v10 = null;
        self.v11 = null;
        self.v12 = null;
    }
}