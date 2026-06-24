contract ManyPrimitiveFields {
    
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;

    bool1: Bool;
    bool2: Bool;
    bool3: Bool;

    str1: String;
    str2: String;

    cell1: Cell;
    cell2: Cell;

    slice1: Slice;
    slice2: Slice;

    address1: Address;
    address2: Address;

    
    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.int4 = 4;

        self.bool1 = true;
        self.bool2 = false;
        self.bool3 = true;

        self.str1 = "a";
        self.str2 = "b";

        self.cell1 = emptyCell();
        self.cell2 = emptyCell();

        self.slice1 = emptyCell().asSlice();
        self.slice2 = emptyCell().asSlice();

        self.address1 = myAddress();
        self.address2 = myAddress();
    }
}
