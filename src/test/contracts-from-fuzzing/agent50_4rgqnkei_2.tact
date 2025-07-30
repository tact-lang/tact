trait TraitA {
    // Abstract function to be overridden
    abstract fun doSomething(x: Int): Int;
    
    // Virtual function with default behavior
    virtual fun defaultFunction(x: Int): Int {
         return x + 1;
    }
    
    // Abstract constant: must be provided by inheriting contract
    abstract const abstractConst: Int;
    
    // Virtual constant with a default value
    virtual const virtualConst: Int = 100;
}

contract TestContract() with TraitA {
    // Overriding the abstract function
    override fun doSomething(x: Int): Int {
         return x * 2;
    }
    
    // Overriding the abstract constant
    override const abstractConst: Int = 50;
    
    // Overriding the virtual constant
    override const virtualConst: Int = 200;

    fun test() {
         // Using the virtual function (default implementation from trait) -> should return x + 1
         let a = self.defaultFunction(3); // expect 4
         // Using the overridden abstract function
         let b = self.doSomething(3); // expect 6
         
         dump(a);
         dump(b);
         dump(self.virtualConst);
         dump(self.abstractConst);
    }

    receive() {
         self.test();
         // Terminate execution
    }
}
