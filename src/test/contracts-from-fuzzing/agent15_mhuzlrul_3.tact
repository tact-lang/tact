trait Parent {
    fun foo(): Int {
        return 1;
    }
    virtual fun bar(): Int {
        return 10;
    }
    const abc: Int = 100;
    virtual const def: Int = 200;
}

trait Child with Parent {
    override fun bar(): Int {
        return self.foo() + 20; // if foo() is overridden in contract, uses that value
    }
    fun call(): Int {
        return self.foo() + self.bar();
    }
}

contract Test() with Child {
    override fun foo(): Int {
        return 5;
    }
    override const def: Int = 250;

    receive() {
        let s = self.call(); // should be 5 + (5+20) = 30
        require(s == 30, "sum should be 30");
        require(self.abc == 100, "abc mismatch");
        require(self.def == 250, "def mismatch");
    }
}
