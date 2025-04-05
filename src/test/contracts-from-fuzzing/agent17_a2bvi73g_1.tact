trait TraitTest {
    abstract fun f(): Int;
    virtual fun g(): Int { return 10; }

    abstract const C: Int;
    virtual const D: Int = 20;
}

contract C() with TraitTest {
    override fun f(): Int { return 5; }
    override const C: Int = 100;
    
    receive() {
        let sum = self.f() + self.g() + self.C + self.D;
        dump(sum); // Expected output: 135
        cashback(sender());
    }
}
