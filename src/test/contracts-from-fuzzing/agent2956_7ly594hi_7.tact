struct SomeStruct {
    a: Int;
    b: Int?;
    c: String;
    d: Bool;
}

contract MultiVars {
    var1: Int;
    var2: String;
    var3: Bool;
    var4: SomeStruct;
    var5: SomeStruct;

    init() {
        self.var1 = 5;
        self.var2 = "test";
        self.var3 = true;
        self.var4 = SomeStruct{ a: 1, b: null, c: "ok", d: false };
        self.var5 = SomeStruct{ a: 2, b: null, c: "ok2", d: true };
    }
}
