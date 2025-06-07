contract OptionalDefaults {
    o1: Int? = null;
    o2: Bool? = false;
    o3: Address? = null;
    o4: Slice? = null;
    o5: String? = "hi";

    init() {
        self.o1 = 100;
        self.o2 = null;
        self.o3 = myAddress();
        self.o4 = emptyCell().asSlice();
        self.o5 = "ok";
    }
}