contract NestedDefaults {
    a: Int = 1;
    b: Bool? = null;
    c: String = "x";
    d: Int? = null;

    init() {
        self.a=2; self.b=null; self.c="y"; self.d=3;
    }
}