contract Test {
    receive() {}
    
    // Test 2: Early return with if-else in a regular function
    fun test2(flag: Bool): Int {
         if(flag) { return 1; } else { return 0; }
    }
}
