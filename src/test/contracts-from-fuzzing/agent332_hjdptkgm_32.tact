contract OptionalAndDefault {
    field1: Int?;
    field2: Int = 5;

    init() {
        self.field1 = null;
        self.field2 = 10;
    }
}