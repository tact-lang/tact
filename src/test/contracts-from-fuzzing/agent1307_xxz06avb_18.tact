contract OnlyOptionals {
    o1: Int? = null;
    o2: String? = null;
    o3: Bool? = null;
    o4: Int? = null;
    o5: String? = null;

    init() {
        self.o1 = 1;
        self.o2 = "hi";
        self.o3 = true;
        self.o4 = 100;
        self.o5 = "bye";
    }
}