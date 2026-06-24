contract ListManyPrimitives {
    int1: Int;
    int2: Int;
    bool1: Bool;
    bool2: Bool;
    string1: String;
    string2: String;
    address1: Address;
    address2: Address;
    cell1: Cell;
    cell2: Cell;
    slice1: Slice;
    slice2: Slice;
    builder1: Builder;
    builder2: Builder;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.bool1 = true;
        self.bool2 = false;
        self.string1 = "hi";
        self.string2 = "bye";
        self.address1 = myAddress();
        self.address2 = myAddress();
        self.cell1 = emptyCell();
        self.cell2 = emptyCell();
        self.slice1 = emptyCell().asSlice();
        self.slice2 = emptyCell().asSlice();
        self.builder1 = beginCell();
        self.builder2 = beginCell();
    }
}