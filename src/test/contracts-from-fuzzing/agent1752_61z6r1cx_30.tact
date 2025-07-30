contract OptionalFieldsDefaultsMix {
    a: Int = 1;
    b: Int? = null;
    c: Int;

    init() {
        self.c = 10;
    }
}