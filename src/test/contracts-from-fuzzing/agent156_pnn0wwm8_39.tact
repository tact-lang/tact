contract BoolThenStrThenIntOpt {
    b: Bool;
    s: String;
    i: Int?;

    init() {
        self.b = true;
        self.s = "xx";
        self.i = null;
    }
}
