contract ManyNestedOptionals {
    o1: Bool?;
    o2: String?;
    o3: Int?;
    o4: Bool?;
    o5: Int?;

    init() {
        self.o1 = null;
        self.o2 = "hi";
        self.o3 = null;
        self.o4 = null;
        self.o5 = 5;
    }
}