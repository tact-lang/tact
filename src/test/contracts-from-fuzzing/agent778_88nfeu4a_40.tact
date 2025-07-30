contract OptionalAndNonOptional {
    a: Int? = null;
    b: Int = 1;

    init() {
        self.a = null;
        self.b = 2;
    }
}