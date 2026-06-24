contract TestReturn {
    init() {}
    
    fun testReturn(): Int {
        { dump(100); }  // block with a statement and no trailing semicolon
        return 42;
    }
    
    receive() {
        dump(self.testReturn());
    }
}
