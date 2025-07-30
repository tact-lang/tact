contract NestedOptionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: Cell?;
    f5: Slice?;
    f6: Builder?;
    
    init() {
        self.f1 = 1;
        self.f2 = null;
        self.f3 = "hi";
        self.f4 = null;
        self.f5 = emptyCell().asSlice();
        self.f6 = null;
    }
}