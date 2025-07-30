contract OnlyOptionalField {
    data: Int?;

    init() {
        self.data = null;
    }
}