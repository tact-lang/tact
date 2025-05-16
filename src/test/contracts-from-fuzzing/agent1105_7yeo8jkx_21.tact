contract MixedOptionals {
    o1: Int?; o2: String?; o3: Bool?;
    v1: Int = 10;
    v2: String = "str";
    v3: Bool = false;

    init() {
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
        self.v1 = 11;
        self.v2 = "other";
        self.v3 = true;
    }
}