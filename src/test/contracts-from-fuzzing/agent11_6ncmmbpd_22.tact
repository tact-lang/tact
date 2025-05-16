trait WildThing {
    // Using wildcards for unused parameters
    virtual fun combine(_: Int, b: Int): Int {
        return b;
    }
}

contract Impl with WildThing {
    // Overriding with concrete parameter names
    override fun combine(a: Int, b: Int): Int {
        return a + b;
    }

    receive() {
        dump(self.combine(2, 3)); // expected output: 5
    }
}
