contract OptsAndPrimitives {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    count: Int;
    flag: Bool;
    text: String;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.count = 100;
        self.flag = true;
        self.text = "data";
    }
}