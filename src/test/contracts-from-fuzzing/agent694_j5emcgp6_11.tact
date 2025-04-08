contract TestContract {
    foo: Int;
    bar: Bool;
    baz: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = "data";
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
    }
}