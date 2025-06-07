contract LotsOfVars {
    v1: Int = 1;
    v2: Int = 2;
    v3: Int = 3;
    v4: Int = 4;
    v5: Int = 5;
    v6: Int = 6;
    v7: Int = 7;
    v8: Int = 8;
    v9: Int = 9;
    v10: Int = 10;
    v11: Bool = true;
    v12: Bool = false;
    v13: Bool = true;
    v14: Bool = false;
    v15: String = "x";
    v16: String = "y";
    v17: String = "z";
    v18: Address?;
    v19: Address?;
    v20: Cell;

    init() {
        self.v18 = null;
        self.v19 = null;
        self.v20 = emptyCell();
    }
}
