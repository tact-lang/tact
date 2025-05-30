contract Test {
    receive() {}
    
    // Getter with arguments: returns the sum of two integers
    get fun getSum(a: Int, b: Int): Int {
         return a + b;
    }
}
