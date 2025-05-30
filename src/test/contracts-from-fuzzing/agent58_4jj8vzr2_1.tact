trait T1 {
    abstract fun foo(): Int;
}

contract C1() with T1 {
    override fun foo(): Int {
       return 42;
    }
    
    receive() {
       let res = self.foo();
       // test the result is 42 (not actually printed, just ensuring override works)
       cashback(sender());
    }
}
