// Large persistent storage with mix of optionals, String, Cell, primitives
contract MixedLarge {
    int1: Int;
    int2: Int?;
    flag1: Bool;
    flag2: Bool?;
    text1: String;
    text2: String?;
    cell1: Cell;
    cell2: Cell?;
    slice1: Slice;
    slice2: Slice?;
    address1: Address;
    address2: Address?;

    init() {
        self.int1 = 1;
        self.int2 = null;
        self.flag1 = false;
        self.flag2 = true;
        self.text1 = "abc";
        self.text2 = null;
        self.cell1 = emptyCell();
        self.cell2 = null;
        self.slice1 = emptyCell().asSlice();
        self.slice2 = null;
        self.address1 = myAddress();
        self.address2 = null;
    }
}