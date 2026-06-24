contract OptionalChain {
    o1: Int?;
    o2: Int?;
    o3: Bool?;

    init() {
        self.o1 = null;
        self.o2 = 7;
        self.o3 = null;
    }

    receive() {
        if (self.o3 == null) {
            self.o3 = false;
        }
    }
}