contract OptionalEdge {
    field1: Int?;
    field2: Bool?;
    field3: Int?;
    field4: Bool?;

    init() {
        self.field1 = null;
        self.field2 = null;
        self.field3 = 123;
        self.field4 = true;
    }
}