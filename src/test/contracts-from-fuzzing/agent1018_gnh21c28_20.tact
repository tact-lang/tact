contract OnlyOneOptional {
    optionalField: Int?;

    init() {
        self.optionalField = null;
    }
}