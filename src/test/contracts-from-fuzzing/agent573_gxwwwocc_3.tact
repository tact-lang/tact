contract OptionalFieldsTest {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Cell?;
    o5: Address?;

    init() {
        self.o1 = 123;
        self.o2 = true;
        self.o3 = "hello";
        self.o4 = emptyCell();
        self.o5 = myAddress();
    }
}