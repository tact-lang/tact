trait MyTestBaseTrait {
    // Abstract function that must be overridden
    abstract fun f(): Int;

    // A concrete constant available to inheritors
    const BASE: Int = 100;

    // An abstract constant that must be defined in the inheriting contract
    abstract const ABS: Int;

    // A virtual constant that can be overridden
    virtual const VIRT: Int = 200;

    // A virtual function that uses f() and the BASE constant
    virtual fun g(): Int {
        return self.f() + self.BASE;
    }
}

contract TestContract(x: Int) with MyTestBaseTrait {
    // The contract parameter 'x' automatically becomes a persistent state variable accessible as self.x
    
    // Overriding the abstract constant ABS and the virtual constant VIRT
    override const ABS: Int = 50;
    override const VIRT: Int = 300;

    // Overriding the abstract function f() using the persistent variable self.x
    override fun f(): Int {
        return self.x;
    }

    // An internal receiver to trigger our test
    receive() {
        // Compute sum of trait-derived values
        let sum = self.g() + self.BASE + self.ABS + self.VIRT;
        reply(sum.toString());
        cashback(sender());
    }
}

// Dummy helper function to mimic reply messaging
inline fun reply(str: String) {
    dump(str);
}
