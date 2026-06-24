contract Test {
    // State variable for int
    value: Int = 10;
    
    // A basic getter function returning a primitive type
    get fun getValue(): Int {
        return self.value;
    }
    
    receive() {}
}
