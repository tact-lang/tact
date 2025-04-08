contract OnlyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: Slice?;
    o5: Cell?;
    o6: String?;

    init() {
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
        self.o4 = null;
        self.o5 = null;
        self.o6 = null;
    }

    receive() {}
}