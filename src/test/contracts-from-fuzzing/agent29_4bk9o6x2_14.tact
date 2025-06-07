contract TestContract {
    fun testReturn(): Int {
        return 123;
    }
    
    receive() {
        dump(self.testReturn());
    }
}
