contract Test {
    x: Int = 10;
    
    receive() {}
    
    fun inc(): Int {
        self.x += 5;
        return self.x;
    }
}
