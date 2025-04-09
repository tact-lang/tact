trait MyTrait {
    abstract const overrideMe: Int;
    virtual const youCanOverrideMe: Int = 100;
    abstract fun testFunc(): Int;
}

contract MyContract() with MyTrait {
    override const overrideMe: Int = 42;
    override const youCanOverrideMe: Int = 200;
    
    override fun testFunc(): Int {
       return self.overrideMe + self.youCanOverrideMe;
    }
    
    receive() {
       let r = self.testFunc();
       cashback(sender());
    }
    
    get fun getResult(): Int {
       return self.testFunc();
    }
}
