trait T {
    abstract fun absFunc(x: Int): Int;
    virtual fun virtFunc(x: Int): Int {
        return x + 10;
    }
}

contract C() with T {
    override fun absFunc(x: Int): Int {
        return x * 2;
    }
    override fun virtFunc(x: Int): Int {
        return x + 20;
    }
    
    receive() {
        let a = self.absFunc(3); // expected 6
        let v = self.virtFunc(3); // expected 23
        require(a == 6, "absFunc error");
        require(v == 23, "virtFunc error");
        cashback(sender());
    }
}
