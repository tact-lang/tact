contract LargePrimitives {
    v1: Int = 1;
    v2: Int = 2;
    v3: Int = 3;
    v4: Int = 4;
    v5: Int = 5;
    v6: Bool = true;
    v7: Bool = false;
    v8: Bool = true;
    v9: String = "1";
    v10: String = "2";
    v11: String = "3";
    v12: String = "4";
    v13: Address;
    v14: Cell;
    v15: Slice;

    init() {
        self.v13 = myAddress();
        self.v14 = emptyCell();
        self.v15 = emptyCell().asSlice();
    }
}