contract LargeOptionBoolChain {
    o1: Bool?;
    o2: Bool?;
    o3: Bool?;
    o4: Bool?;
    o5: Bool?;

    init() {
        self.o1 = null;
        self.o2 = true;
        self.o3 = null;
        self.o4 = false;
        self.o5 = null;
    }

    receive() {}
}