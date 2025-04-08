contract TestContract {
    f1: Int as uint8;
    f2: Int as int64;
    f3: Int as uint32;
    f4: Int as int257;
    f5: Bool;
    f6: Address;
    f7: Cell;
    f8: Slice;
    f9: String;
    init() {
        self.f1 = 255; 
        self.f2 = -123456789; 
        self.f3 = 123456789; 
        self.f4 = -1;
        self.f5 = true;
        self.f6 = myAddress();
        self.f7 = emptyCell();
        self.f8 = emptyCell().asSlice();
        self.f9 = "serialized";
    }
}