trait FuncTrait {
    abstract fun absFunc(x: Int): Int;
    virtual fun virtFunc(x: Int): Int {
       return x + 10;
    }
}

contract TestContract() with FuncTrait {
    override fun absFunc(x: Int): Int {
       return x * 3;
    }
    
    override fun virtFunc(x: Int): Int {
       return x + 20;
    }
    
    receive() {
       let a = self.absFunc(5);
       let b = self.virtFunc(5);
       require(a == 15, "absFunc incorrect");
       require(b == 25, "virtFunc incorrect");
       // no outbound messages needed
    }
}
