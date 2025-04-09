// Test long list of primitive optional contract fields directly
contract ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: String?;
    o5: Slice?;
    o6: Cell?;

    init() {
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
        self.o4 = null;
        self.o5 = null;
        self.o6 = null;
    }
}