contract TestOptionalDefaultConflict {
    a: Int? = null;
    b: Int = 5;

    init() {
        self.a = null;
        self.b = 10;
    }
}
