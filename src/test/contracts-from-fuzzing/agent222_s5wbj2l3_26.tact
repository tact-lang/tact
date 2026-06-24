contract OptionalAndDefault {
    a: Int? = null;
    b: String? = "foo";
    c: Bool?;

    init() {
        self.c = false;
    }
}