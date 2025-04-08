contract ManyOptionals {
    o1: Int? = null;
    o2: Int? = 42;
    o3: Bool? = null;
    o4: Bool? = true;
    o5: Address? = null;
    o6: Address? = null;
    o7: Cell? = null;
    o8: Cell? = null;

    init() {
        self.o1 = 1;
        self.o3 = false;
        self.o4 = null;
        self.o5 = null;
    }
}