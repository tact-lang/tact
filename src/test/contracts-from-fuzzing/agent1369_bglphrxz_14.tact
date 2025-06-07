struct Mixed {
    x1: Int = 1;
    b1: Bool = false;
    x2: Int = 2;
    b2: Bool = true;
    str1: String = "a";
    addr1: Address;
    cell1: Cell;
    slice1: Slice;
    builder1: Builder;
    str2: String = "b";
    b3: Bool = true;
    x3: Int = 3;
}

contract TestBigStruct {
    data: Mixed;

    init() {
        self.data = Mixed{
            addr1: myAddress(),
            cell1: emptyCell(),
            slice1: emptyCell().asSlice(),
            builder1: beginCell()
        };
    }
}