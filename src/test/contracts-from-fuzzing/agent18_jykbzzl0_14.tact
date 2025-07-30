contract Test {
    receive() {}
    
    // Getter with a parameter returning an optional Int based on a condition
    get fun getConditional(a: Int): Int? {
         if (a > 10) {
             return a;
         } else {
             return null;
         }
    }
}
