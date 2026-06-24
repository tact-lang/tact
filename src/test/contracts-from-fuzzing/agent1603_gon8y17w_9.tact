contract ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: String?;

    init() {
        self.o1 = 1;
        self.o2 = null;
        self.o3 = true;
        self.o4 = null;
    }
}