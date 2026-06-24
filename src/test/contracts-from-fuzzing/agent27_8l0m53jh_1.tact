contract Test {
    v: Int = 42;
    
    // required empty receive to ensure full compilation
    receive() {}

    // Getter returning a primitive Int value
    get fun getInt(): Int {
        return self.v;
    }
}
