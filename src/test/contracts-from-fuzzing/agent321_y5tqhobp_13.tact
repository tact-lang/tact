contract ManyPrimitiveFields {
    int1: Int = 1;
    int2: Int = 2;
    int3: Int = 3;
    int4: Int = 4;
    bool1: Bool = true;
    bool2: Bool = false;
    string1: String = "s1";
    string2: String = "s2";
    slice1: Slice;
    cell1: Cell;
    address1: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    init() {
        self.slice1 = emptyCell().asSlice();
        self.cell1 = emptyCell();
        self.address1 = myAddress();
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
    }
}