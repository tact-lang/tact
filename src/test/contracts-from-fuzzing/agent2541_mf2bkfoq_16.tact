contract ZeroDefaults {
    field1: Int;
    field2: Bool;
    field3: Int?;
    field4: Bool?;

    init() {
        self.field1 = 0;
        self.field2 = false;
        self.field3 = null;
        self.field4 = null;
    }
}