contract TestContract {
    f1: Int = 1;
    f2: Int = 2;
    f3: Bool = true;
    f4: Bool? = false;
    f5: Address;
    f6: String = "abc";
    f7: Cell; // no default
    f8: Slice;
    f9: Builder;

    init() {
        self.f5 = myAddress();
        self.f7 = emptyCell();
        self.f8 = emptyCell().asSlice();
        self.f9 = beginCell();
    }
}
