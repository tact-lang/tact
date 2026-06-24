contract MixedTypes {
    v1: Bool;
    v2: Int;
    v3: String;
    v4: Cell;
    v5: Slice;
    v6: Bool?;
    v7: Int?;
    v8: String?;
    v9: Cell?;
    v10: Slice?;

    init() {
        self.v1 = false;
        self.v2 = 42;
        self.v3 = "hi";
        self.v4 = emptyCell();
        self.v5 = emptyCell().asSlice();
        self.v6 = null;
        self.v7 = -1;
        self.v8 = null;
        self.v9 = null;
        self.v10 = null;
    }
}