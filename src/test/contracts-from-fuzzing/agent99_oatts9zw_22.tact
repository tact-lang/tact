contract StorageTest {
    a1: Int;
    a2: Int?;
    a3: Int;
    a4: Int?;
    a5: Int;
    a6: Int?;
    b1: Bool;
    b2: Bool?;
    b3: Bool;
    b4: Bool?;
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
    addr1: Address;
    addr2: Address?;
    cell1: Cell;
    cell2: Cell?;
    slice1: Slice;
    slice2: Slice?;

    init() {
        self.a1 = 1; self.a2 = 2; self.a3 = 3; self.a4 = 4; self.a5 = 5; self.a6 = 6;
        self.b1 = true; self.b2 = false; self.b3 = true; self.b4 = false;
        self.s1 = "foo"; self.s2 = null; self.s3 = "bar"; self.s4 = null;
        self.addr1 = myAddress(); self.addr2 = null;
        self.cell1 = emptyCell(); self.cell2 = null;
        self.slice1 = emptyCell().asSlice(); self.slice2 = null;
    }
}