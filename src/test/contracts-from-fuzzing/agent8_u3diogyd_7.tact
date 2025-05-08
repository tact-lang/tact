trait BaseT {
    fun foo(): Int {
        return 1;
    }
}

trait DerivedT with BaseT {
    override fun foo(): Int {
        return 2;
    }
}

contract TestF() with DerivedT {
    fun testF() {
        let r = self.foo();
        dump(r); // expected output: 2
    }
    
    receive() {
        self.testF();
        cashback(sender());
    }
}
