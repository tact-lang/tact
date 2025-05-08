contract Test {
    // Test return statement in a function
    fun testReturn(): Int {
         return 100;
    }
    
    receive() {
         dump(self.testReturn());
    }
}
