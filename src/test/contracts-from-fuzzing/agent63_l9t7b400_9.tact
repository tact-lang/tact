contract TestReturnValid {
    // Test: valid return statement in a function
    fun testReturn(): Int {
        return 42;
    }
    
    receive() {
        // calling self.testReturn() since it's a member function
        let result: Int = self.testReturn();
        dump(result);
    }
}
