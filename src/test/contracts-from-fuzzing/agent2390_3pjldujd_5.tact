contract OptionalFields {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    
    init() {
        self.o1 = null;
        self.o2 = true;
        self.o3 = null;
    }
}