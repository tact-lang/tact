contract ManyFields {
    var1: Int;
    var2: Int;
    var3: Bool;
    var4: Bool;
    var5: Int?;
    var6: Bool?;
    var7: String;
    var8: String?;
    var9: Address;
    var10: Address?;

    init() {
        self.var1 = 1;
        self.var2 = 2;
        self.var3 = true;
        self.var4 = false;
        self.var5 = null;
        self.var6 = true;
        self.var7 = "hello";
        self.var8 = null;
        self.var9 = myAddress();
        self.var10 = null;
    }
}