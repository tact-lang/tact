contract Test1 {
    
    receive() {}
    
    // Test regular function with early return
    fun test(x: Int): Int {
       if (x < 0) { 
          return 0; 
       }
       return x;
    }
}
