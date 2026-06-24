contract LargeMixedTypes {
    var0: Int;
    var1: Bool;
    var2: String;
    var3: Address;
    var4: Cell;
    var5: Slice;
    var6: Int?;
    var7: Bool?;
    var8: String?;
    var9: Address?;

    init() {
        self.var0 = 1;
        self.var1 = true;
        self.var2 = "hi";
        self.var3 = myAddress();
        self.var4 = emptyCell();
        self.var5 = emptyCell().asSlice();
        self.var6 = null;
        self.var7 = false;
        self.var8 = "maybe";
        self.var9 = null;
    }
}