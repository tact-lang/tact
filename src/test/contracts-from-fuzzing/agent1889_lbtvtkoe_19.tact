contract OptionalDirect {
    field1: Int?;
    field2: Bool?;
    field3: String?;
    field4: Address?;

    init() {
        self.field1 = null;
        self.field2 = null;
        self.field3 = "abc";
        self.field4 = null;
    }
}