trait TraitConst {
    // Declare an abstract constant
    abstract const VAL: Int;

    fun getVal(): Int {
         return self.VAL;
    }
}

contract TestConst() with TraitConst {
    // Override the trait constant
    override const VAL: Int = 100;
    
    receive() {
         let res = self.getVal();
         require(res == 100, "Unexpected value");
         cashback(sender());
    }
}
