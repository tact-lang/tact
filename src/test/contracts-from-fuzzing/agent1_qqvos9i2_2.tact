trait TraitA {
    abstract fun f(): Int;
    fun g(): Int {
        return self.f() + 1;
    }
}

contract TestContract() with TraitA {
    override fun f(): Int { return 10; }
    receive() {
        let a = self.f();
        let b = self.g();
        dump(a);
        dump(b);
    }
}
