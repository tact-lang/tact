struct S {
    a: Int;
}

contract AssignDefaults {
    var1: S?;
    var2: S = S{ a: 0 };

    init() {
        self.var1 = null;
        self.var2 = S{ a: 42 };
    }
}