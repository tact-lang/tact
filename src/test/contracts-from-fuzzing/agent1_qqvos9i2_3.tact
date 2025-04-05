trait TraitA {
    abstract fun f(): Int;
    fun g(): Int {
        return self.f() + 1;
    }
}

trait TraitB {
    fun f(): Int { return 20; }
    fun h(): Int { return self.f() + 2; }
}

contract TestContract() with TraitA, TraitB {
    // Note: Depending on Tact's rules, inheriting a conflicting f() might require an override.
    // Let's explicitly override f() to resolve ambiguity.
    override fun f(): Int {
        // We decide to use TraitB's implementation explicitly.
        return 20;
    }
    receive() {
        dump(self.f());
        dump(self.g());
        dump(self.h());
    }
}
