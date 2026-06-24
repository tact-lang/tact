struct Composed {
    a: Int;
    b: Bool;
}

contract ManyVars {
    var1: Int = 1;
    var2: Bool = true;
    var3: Composed;
    var4: Int?;
    var5: Bool?;

    init() {
        self.var3 = Composed{ a: 5, b: false };
        self.var4 = null;
        self.var5 = true;
    }
}