contract TestSlice {
    receive() {}
    
    // Getter returning a Slice created from a string
    get fun getSlice(): Slice {
        return "hello".asSlice();
    }
}
