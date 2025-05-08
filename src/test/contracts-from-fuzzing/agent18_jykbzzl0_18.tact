contract Test {
    receive() {}
    
    // Getter returning a nullable Slice
    get fun getNullSlice(): Slice? {
         return null;
    }
}
