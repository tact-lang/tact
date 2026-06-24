contract Test {
    x: Int = 42;
    
    receive() {}

    get fun getInt(): Int {
        return self.x;
    }
}
