contract LargePrimitives {
    int1: Int = 1;
    int2: Int = 2;
    int3: Int = 3;
    int4: Int = 4;
    int5: Int = 5;
    bool1: Bool = true;
    bool2: Bool = false;
    address1: Address;
    address2: Address;
    cell1: Cell;
    cell2: Cell;

    init() {
        self.address1 = myAddress();
        self.address2 = myAddress();
        self.cell1 = emptyCell();
        self.cell2 = emptyCell();
    }
}
