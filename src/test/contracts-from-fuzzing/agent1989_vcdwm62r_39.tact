contract ManyMixFields {
    var1: Int = 1;
    var2: String = "a";
    var3: Bool = true;
    var4: Int? = null;
    var5: String? = null;
    var6: Bool? = null;

    init() {
        self.var1 = 42;
        self.var2 = "b";
        self.var3 = false;
        self.var4 = null;
        self.var5 = null;
        self.var6 = null;
    }
}