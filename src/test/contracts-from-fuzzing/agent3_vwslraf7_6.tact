trait TestTrait {
    virtual const X: Int = 5;
    fun foo(): Int {
         return self.X + 1;
    }
}

contract TestContract() with TestTrait {
    override const X: Int = 10;
    receive() {
         dump(self.foo()); // Expected: 11
         cashback(sender());
    }
}
