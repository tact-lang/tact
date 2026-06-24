contract Test {
    v: Int = 42;
    
    // Receiver to ensure full compilation
    receive() {}

    // Getter function returning a primitive value
    get fun getV(): Int {
        return self.v;
    }
}
