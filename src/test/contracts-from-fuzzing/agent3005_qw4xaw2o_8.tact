contract ManyPrimitives {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;

    init() {
        self.f1 = 42;
        self.f2 = true;
        self.f3 = "hi";
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
    }
}