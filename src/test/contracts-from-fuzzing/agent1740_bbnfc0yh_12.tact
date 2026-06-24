contract Mix {
    var1: Int = 1;
    var2: Bool = true;
    var3: Address;
    var4: Slice;
    var5: Cell;
    var6: String = "abc";

    init() {
        self.var3 = myAddress();
        self.var4 = emptyCell().asSlice();
        self.var5 = emptyCell();
        self.var1 = 42;
        self.var2 = false;
        self.var6 = "xyz";
    }
}