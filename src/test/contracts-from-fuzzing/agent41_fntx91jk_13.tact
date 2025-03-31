trait WildTrait {
    // Using wildcards for unused parameters is allowed in trait methods per documentation
    virtual fun f(_: Int, _: Int): Int {
        return 0;
    }
}

contract TestTraitOverride with WildTrait {
    // Overriding with proper parameter names
    override fun f(a: Int, b: Int): Int {
        return a + b;
    }

    receive() {
        self.f(10, 20);
    }
}
