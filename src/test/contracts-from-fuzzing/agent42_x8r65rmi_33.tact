contract NullableAddressCellSlice {
    a: Address?;
    b: Cell?;
    c: Slice?;
    
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}