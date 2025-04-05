trait TraitA {
    // A concrete function returning 10
    fun getValA(): Int {
        return 10;
    }
    // A virtual function with a default implementation returning 20;
    // intended to be overridden if needed.
    virtual fun getValB(): Int {
        return 20;
    }
}

trait TraitB {
    // An abstract declaration of the function getValB()
    // This forces any contract mixing in TraitB to provide an override.
    abstract fun getValB(): Int;
    // A concrete function returning 30.
    fun getValC(): Int {
        return 30;
    }
}

contract MyContract() with TraitA, TraitB {
    // MUST override getValB() because TraitB declared it abstract,
    // and this override also replaces the virtual function from TraitA.
    override fun getValB(): Int {
        // This implementation calls getValA() from TraitA and getValC() from TraitB.
        return self.getValA() + self.getValC();
    }
    
    // A minimal receiver function that sends a message containing the result.
    receive() {
        let result = self.getValB(); // Expected: 10 + 30 = 40
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: result.toString().asComment(),
        });
    }
}
