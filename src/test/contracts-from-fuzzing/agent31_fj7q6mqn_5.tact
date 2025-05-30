trait TraitA {
    fun foo(): Int {
         return 1;
    }
}

trait TraitB {
    fun foo(): Int {
         return 2;
    }
}

contract TestContract() with TraitA, TraitB {
    // Override the conflicting function to resolve ambiguity
    override fun foo(): Int {
         // Let's choose TraitB's implementation
         return 2;
    }
    
    receive() {
         let res = self.foo();
         require(res == 2, "Unexpected result, expected 2");
         cashback(sender());
    }
}
