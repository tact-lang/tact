contract Test {
    x: Int = 10;
    
    receive() {}

    fun test1(): Int {
        return self.x;
    }
}
