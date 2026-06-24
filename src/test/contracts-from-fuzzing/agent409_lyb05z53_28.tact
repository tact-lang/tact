contract OptionalsDefaultsMix {
    var1: Int?;
    var2: String?;
    var3: Bool? = null;
    var4: Address;

    init() {
        self.var1 = null;
        self.var2 = null;
        self.var4 = myAddress();
    }
}