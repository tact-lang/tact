contract ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: Bool?;
    o5: String?;
    o6: String?;

    init() {
        self.o1 = null;
        self.o2 = 42;
        self.o3 = true;
        self.o4 = null;
        self.o5 = "test";
        self.o6 = null;
    }
}