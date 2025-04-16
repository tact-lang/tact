contract TestGetterSlice {
    s: Slice;

    init() {
         // Create a slice from a cell that stores an integer 456 in 10 bits
         self.s = beginCell().storeInt(456, 10).asSlice();
    }

    receive() {}

    // Getter function that returns a Slice
    get fun getSlice(): Slice {
         return self.s;
    }
}
