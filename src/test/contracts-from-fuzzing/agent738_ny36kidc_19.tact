contract ManyFieldsOptionsDefaults {
    i1: Int = 1;
    b1: Bool = true;
    o1: Int? = null;
    o2: Bool? = false;

    init() {
        self.i1 = 42;
        self.b1 = false;
        self.o1 = null;
        self.o2 = true;
    }
}