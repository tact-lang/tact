struct NestedOptional {
    a: Int?;
    b: Bool?;
}

contract Test {
    var1: Int?;
    var2: Bool?;
    var3: NestedOptional?;
    var4: String?;

    init() {
        self.var1 = null;
        self.var2 = null;
        self.var3 = null;
        self.var4 = null;
    }
}