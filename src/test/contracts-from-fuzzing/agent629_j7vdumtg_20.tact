contract OptionalMixed {
    ia: Int?;
    ib: Int = 5;
    sa: String?;
    sb: String = "bar";
    ba: Bool?;
    bb: Bool = true;

    init() {
        self.ia = null;
        self.ib = 42;
        self.sa = null;
        self.sb = "baz";
        self.ba = null;
        self.bb = false;
    }
}