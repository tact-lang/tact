contract OptionalVsNonOptional {
    field1: Int;
    field2: Int?;
    field3: Int;
    field4: Int?;
    field5: Int;

    init() {
        self.field1 = 1;
        self.field2 = null;
        self.field3 = 3;
        self.field4 = 4;
        self.field5 = 5;
    }
}