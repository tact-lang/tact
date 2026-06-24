contract MixedFieldTypes {
    i: Int;
    b: Bool;
    o: Int?;
    ob: Bool?;
    s: String;

    init() {
        self.i = 1;
        self.b = true;
        self.o = null;
        self.ob = null;
        self.s = "hello";
    }
}