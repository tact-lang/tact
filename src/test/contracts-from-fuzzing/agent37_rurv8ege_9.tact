/* Test G: Using multiple wildcards in a trait function signature (should be allowed) */

trait WildThing {
    // Using wildcards for parameter names in trait virtual function is allowed
    virtual fun assure(_: Int, _: Int): Bool {
        return true;
    }
}

contract TestG with WildThing {
    // Overriding the trait function with proper parameter names
    override fun assure(a: Int, b: Int): Bool {
        return a + b == b + a;
    }

    receive() {}
}
