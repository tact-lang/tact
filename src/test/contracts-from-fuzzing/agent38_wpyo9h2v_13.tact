contract Test_UnusedGetter {
    receive() {}
    
    // Getter function that is declared but never called
    get fun getUnused(): Int {
        return 123;
    }
}
