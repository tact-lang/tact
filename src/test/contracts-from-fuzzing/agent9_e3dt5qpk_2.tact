trait MyTrait {
    abstract fun foo(): Int;
}

contract TestContract() with MyTrait {
    override fun foo(): Int { return 42; }
    
    receive() {
        let res = self.foo();
        dump(res);
    }
}
