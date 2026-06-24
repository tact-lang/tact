trait T1 {
    abstract fun foo(): Int;
    abstract const A: Int;
    virtual const B: Int = 10;
    
    fun callFoo(): Int {
        return self.foo() + self.A + self.B;
    }
}

contract TestContract() with T1 {
    override fun foo(): Int {
         return 5;
    }
    
    override const A: Int = 3;
    override const B: Int = 20;
    
    receive() {
        let result = self.callFoo();
        dump(result);
        cashback(sender());
    }
}
