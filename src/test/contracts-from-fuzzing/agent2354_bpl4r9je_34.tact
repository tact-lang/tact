contract OnlyOneOptionalField {
    a: Int?;

    init() {
        self.a = null;
    }
}