trait T {
    // Trait-level constants
    const BASE: Int = 100;
    abstract const ABS: Int;
    virtual const VIRT: Int = 200;

    // Abstract function and virtual function
    abstract fun absFun(x: Int): Int;
    virtual fun virtFun(x: Int): Int {
         return x + 1;
    }
}

contract C() with T {
    // Override abstract constant and virtual constant
    override const ABS: Int = 50;
    override const VIRT: Int = 300;
    
    // Override abstract function
    override fun absFun(x: Int): Int {
         return x * 2;
    }
    
    // Override virtual function
    override fun virtFun(x: Int): Int {
         return x * 3;
    }
    
    // A receive function to ensure the functions and constants are used
    receive() {
         let a = self.absFun(10);   // expected 20
         let b = self.virtFun(10);    // expected 30
         let c = self.BASE;           // expected 100
         let d = self.ABS;            // expected 50
         let e = self.VIRT;           // expected 300
         
         require(a == 20, "absFun incorrect");
         require(b == 30, "virtFun incorrect");
         require(c == 100, "constant BASE incorrect");
         require(d == 50, "constant ABS incorrect");
         require(e == 300, "constant VIRT incorrect");
         
         cashback(sender());
    }
}
