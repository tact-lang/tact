contract TestOperators {
    fun test(): Int {
       return 1 + 2 * 3;
    }
    
    receive() {
       self.test();
    }
}
