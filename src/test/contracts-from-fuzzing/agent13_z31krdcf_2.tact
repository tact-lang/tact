trait TraitA {
    // Declare an abstract function
    abstract fun f(): Int;
}

// This trait inherits from TraitA and provides an override for f()
trait TraitB with TraitA {
    override fun f(): Int {
         return 100;
    }
}

contract TestContract() with TraitB {
    // A function to test the inherited trait method
    fun test(): Int {
         return self.f();
    }

    // A simple internal receiver to trigger the function
    receive() {
         dump(self.test());
         cashback(sender());
    }
}
