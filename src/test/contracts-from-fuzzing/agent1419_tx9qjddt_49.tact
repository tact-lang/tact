contract OptionalFieldsDefaultsMix {
    a: Int? = null;
    b: String? = "default";
    c: Bool?;

    init() {
        self.c = true;
    }
}