trait A {
    abstract fun foo(): Int;
    fun bar(): Int { return 10; }
}

contract C() with A {
    override fun foo(): Int { return 100; }
    
    receive() {
         dump(self.foo());
         dump(self.bar());
    }
}
