contract TestSlice {
    receive() {}

    get fun getSlice(): Slice {
         return "Hello, World!".asSlice();
    }
}
