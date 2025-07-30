contract OptionalStructFields {
    field1: Int?;
    field2: Bool?;
    field3: String?;
    field4: Address?;
    field5: Cell?;
    field6: Slice?;

    init() {
        self.field1 = null;
        self.field2 = null;
        self.field3 = null;
        self.field4 = null;
        self.field5 = null;
        self.field6 = null;
    }
}