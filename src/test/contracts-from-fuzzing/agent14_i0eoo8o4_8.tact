trait TraitG {
    virtual fun f(): Int {
        return 1;
    }
    fun g(): Int {
        return self.f() + 10;
    }
}

contract Polymorphism() with TraitG {
    override fun f(): Int {
        return 2;
    }
    receive() {
        let x = self.g(); // Expected to be 12
        dump(x);
    }
}
