contract OptionalPrimDefaults {
    i: Int? = null;
    b: Bool? = false;
    s: String? = null;

    init() {
        self.i=null; self.b=true; self.s="abc";
    }
}
