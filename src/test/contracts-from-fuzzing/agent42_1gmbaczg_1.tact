contract Test {
    x: Int = 42;
    
    // Receiver, empty body
    receive() {}

    // Getter returning a primitive integer
    get fun getX(): Int {
        return self.x;
    }
}
