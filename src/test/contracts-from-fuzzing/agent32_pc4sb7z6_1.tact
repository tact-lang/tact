trait MyTrait {
    // Abstract function: must be overridden
    abstract fun foo(): Int;
}

contract MyContract() with MyTrait {
    // Overriding the abstract function from MyTrait
    override fun foo(): Int {
         return 42;
    }
    
    // Minimal receiver to ensure the contract is used
    receive() {
         cashback(sender());
    }
}
