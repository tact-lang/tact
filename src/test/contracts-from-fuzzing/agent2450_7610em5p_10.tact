contract MultipleOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
    o5: Slice?;
    
    init() {
        self.o1 = null;
        self.o2 = true;
        self.o3 = null;
        self.o4 = null;
        self.o5 = null;
    }
}
