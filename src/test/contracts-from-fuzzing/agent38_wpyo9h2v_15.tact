contract Test_ArgsGetter {
    receive() {}
    
    // Getter function with arguments: returns the sum of two integers
    get fun add(a: Int, b: Int): Int {
        return a + b;
    }
}
