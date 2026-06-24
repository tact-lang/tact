contract TestGetterSlice {
    s: Slice;

    init() {
        // Initialize slice with a raw slice from hex string "4a"
        self.s = rawSlice("4a");
    }

    receive() {}

    get fun getSlice(): Slice {
         return self.s;
    }
}
