contract ChangingOptionals {
    o1: Int? = null;
    o2: Bool? = true;

    init() {
        self.o1 = 42;
        self.o2 = null;
    }
}