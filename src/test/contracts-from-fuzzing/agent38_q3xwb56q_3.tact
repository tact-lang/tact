// Test Case 1: Nested if return in a regular function
contract Test1 {
    fun test() : Int {
         if (true) { return 1; }
         return 2;
    }
}
