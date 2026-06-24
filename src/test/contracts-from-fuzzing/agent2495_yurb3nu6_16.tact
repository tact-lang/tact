contract AddressAndSliceStorage {
    a: Address;
    b: Slice;
    
    init() {
        self.a = myAddress();
        self.b = emptyCell().asSlice();
    }
}