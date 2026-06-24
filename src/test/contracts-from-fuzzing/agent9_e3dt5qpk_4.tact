trait Trait1 {
    fun foo(): Int { return 10; }
    abstract fun bar(): Int;
}

trait Trait2 {
    fun baz(): Int { return 5; }
}

contract Test() with Trait1, Trait2 {
    override fun bar(): Int { return 20; }
    
    receive() {
        let sum = self.foo() + self.bar() + self.baz();
        dump(sum);
    }
}
