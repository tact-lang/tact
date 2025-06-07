contract NullDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;

    init() {
        // override some
        self.a = 5;
        self.b = null; // explicit
        self.c = true;
    }
}
