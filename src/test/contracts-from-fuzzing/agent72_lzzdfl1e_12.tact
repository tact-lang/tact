contract TestSlice {
    s: String = "TestString";

    receive() {}

    get fun getSlice(): Slice {
         return self.s.asSlice();
    }
}
