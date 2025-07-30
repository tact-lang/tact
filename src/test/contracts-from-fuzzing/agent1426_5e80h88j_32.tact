// Test contract with sparse optional fields for null compression
contract SparseOptionalFields {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Int?;
    o6: Int?;
    o7: Int?;
    o8: Int?;
    o9: Int?;
    o10: Int?;

    init() {
        self.o1 = null;
        self.o2 = null;
        self.o3 = 3;
        self.o4 = null;
        self.o5 = null;
        self.o6 = 6;
        self.o7 = null;
        self.o8 = null;
        self.o9 = 9;
        self.o10 = null;
    }
}