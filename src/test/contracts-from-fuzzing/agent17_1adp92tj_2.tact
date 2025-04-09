trait TraitA {
    abstract fun foo(): Int;
}

trait TraitB {
    abstract fun foo(): Int;
    fun bar(): Int {
         return self.foo() + 1;
    }
}

contract TestContract() with TraitA, TraitB {
    override fun foo(): Int {
        return 41;
    }
    
    receive() {
        let r1 = self.foo();
        let r2 = self.bar();
        require(r1 == 41, "Unexpected foo value");
        require(r2 == 42, "Unexpected bar value");
    }
}
