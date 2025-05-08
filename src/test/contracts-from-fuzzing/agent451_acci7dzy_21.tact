contract MixedDefaultsOptionals {
    var1: Int = 5;
    var2: Int? = null;
    var3: Bool = true;
    var4: Bool? = null;

    init() {
        self.var1 = 10;
        self.var2 = null;
        self.var3 = false;
        self.var4 = null;
    }
}