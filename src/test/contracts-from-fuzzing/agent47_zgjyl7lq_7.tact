trait Cond {
    virtual const ENABLE: Bool = true;
    fun branch(): Int {
         if (self.ENABLE) { 
             return 100; 
         } else { 
             return 200; 
         }
    }
}

contract TestCond() with Cond {
    override const ENABLE: Bool = false;
    get fun test(): Int {
         return self.branch();
    }
}
