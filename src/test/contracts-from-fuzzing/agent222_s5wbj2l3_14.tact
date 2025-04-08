struct IntAndBool {
    a: Int;
    b: Bool;
}

contract MultiVars {
    var1: IntAndBool;
    var2: IntAndBool;
    var3: IntAndBool;

    init() {
        self.var1 = IntAndBool{ a: 1, b: true };
        self.var2 = IntAndBool{ a: 2, b: false };
        self.var3 = IntAndBool{ a: 3, b: true };
    }
}