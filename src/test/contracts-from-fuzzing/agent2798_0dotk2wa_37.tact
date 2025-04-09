contract ComplexLayout {
    foo: Int as uint8;
    bar: Int as int16;
    baz: Int as int64;
    optFoo: Int?;
    strVal: String;
    optStr: String?;
    boolVal: Bool;
    optBool: Bool?;

    init() {
        self.foo = 1;
        self.bar = -2;
        self.baz = -3;
        self.optFoo = null;
        self.strVal = "hi";
        self.optStr = null;
        self.boolVal = true;
        self.optBool = false;
    }
}