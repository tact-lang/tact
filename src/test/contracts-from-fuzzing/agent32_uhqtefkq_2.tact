contract TestPrimitive() {
    // Function to test primitive operations with Int type
    fun compute(): Int {
        let a: Int = 42;
        let b: Int = 5 + a; 
        return b;
    }

    // Testing usage in a receiver
    receive() {
         // Call function using self qualifier
         let result = self.compute();
         // We do nothing with result
    }
}
