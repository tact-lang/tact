contract PersistStringsOptionals {
    s1: String = "hello";
    s2: String = "world";
    o1: Int?;
    o2: Bool?;

    init() {
        self.o1 = null;
        self.o2 = null;
    }
}