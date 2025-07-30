contract MixedTypes {
    i: Int = 1;
    b: Bool = false;
    o: Int?;
    ob: Bool?;

    init() {
        self.i = 2;
        self.b = true;
        self.o = null;
        self.ob = null;
    }
}