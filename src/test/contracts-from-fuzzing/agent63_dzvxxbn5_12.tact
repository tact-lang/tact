contract TestGetterArg {
    a: Int = 100;
    
    receive() {}
    
    // Getter function with an argument
    get fun add(x: Int): Int {
        return self.a + x;
    }
}
