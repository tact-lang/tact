trait TraitC {
    // Concrete function with full definition
    fun f(): Int {
         return 10;
    }

    // Virtual function that can be overridden
    virtual fun g(): Int {
         return 20;
    }
}

trait TraitD with TraitC {
    // Override the virtual function g()
    override fun g(): Int {
         return 30;
    }
}

contract TestContract() with TraitD {
    receive() {
         // Call concrete function f() and overridden function g()
         let a = self.f();  // expected 10
         let b = self.g();  // expected 30
         dump(a + b);       // should dump 40
         cashback(sender());
    }
}
